from shiny import App, render, ui
import matplotlib.pyplot as plt
import pandas as pd

# Load the dataset
def load_data():
    url = "https://raw.githubusercontent.com/amnasyed1/datasci_4_web_viz/main/datasets/PLACES__Local_Data_for_Better_Health__County_Data_RI2023_release.csv"
    return pd.read_csv(url)

df = load_data()
df_asthma = df[(df['MeasureId'] == 'ASTHMA') & (df['Data_Value_Type'] == 'Age-adjusted prevalence')]

# Available counties for selection
counties = df_asthma['LocationName'].unique()

app_ui = ui.page_fluid(
    ui.input_select("county", "Select County", {county: county for county in counties}),
    ui.output_text_verbatim("avg_data_value"),
    ui.output_plot("bar_chart")
)

def server(input, output, session):

    @output
    @render.text
    def avg_data_value():
        selected_county = input.county()
        avg_value = df_asthma[df_asthma['LocationName'] == selected_county]['Data_Value'].mean()
        return f"Average Current Asthma Age-adjusted Prevalence for {selected_county}: {avg_value:.2f}%"

    @output
    @render.plot(alt="Current Asthma Age-adjusted Prevalence Bar Chart")
    def bar_chart():
        overall_avg = df_asthma['Data_Value'].mean()
        selected_county_avg = df_asthma[df_asthma['LocationName'] == input.county()]['Data_Value'].mean()

        fig, ax = plt.subplots(figsize=(10, 6))
        ax.bar(['Selected County', 'Overall Average'], [selected_county_avg, overall_avg], color=['thistle', 'lemonchiffon'])
        
        ax.set_ylabel('Data Value (Age-adjusted prevalence) - Percent')
        ax.set_ylim(0, 30)
        ax.set_title('Current Asthma Age-adjusted Prevalence Comparison')
        
        return fig


app = App(app_ui, server)

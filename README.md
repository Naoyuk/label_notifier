# Label Print Notifier

Label Print Notifier is a Rails application designed to help store staff by preventing missed label printing tasks. It analyzes past printing history and sends notifications at appropriate times, ensuring that labels are printed regularly and on time.

## Features

- **Label Selection**: Choose labels to print from a list of available label images.
- **Print Quantity Input**: Enter the number of copies to print for each label.
- **Print Button**: Initiate the printing process.
- **Print History Recording**: Automatically record the details of each print job.
- **Print Frequency Analysis**: Analyze the frequency of label printing for each label.
- **Notification Emails**: Send notification emails when it is time to print labels again.

## Usage

1. **Select Labels**:
    - Go to the **Label Images** list.
    - Select the label you want to print.
    - Enter the number of copies.
    - Click the **Print** button.

2. **View Print History**:
    - Navigate to the **Print History** section.
    - View details of past print jobs, including label type, print quantity, and date.

3. **Receive Notifications**:
    - The application analyzes the print history.
    - When it detects that it's time to print a label again based on past frequency, it sends a notification email.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Naoyuk/label_print_notifier.git
    cd label_print_notifier
    ```

2. Install dependencies:
    ```bash
    bundle install
    ```

3. Set up the database:
    ```bash
    rails db:create
    rails db:migrate
    ```

4. Configure your email settings in `config/environments/production.rb` for production environment or `config/environments/development.rb` for development environment.

5. Start the Rails server:
    ```bash
    rails server
    ```

## Configuration

- **Email Settings**: Configure your SMTP settings to ensure notification emails are sent correctly.
- **Cron Jobs**: Set up cron jobs to run the notification script at regular intervals.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, please contact us at 39.ishida@gmail.com.

const puppeteer = require('puppeteer');


async function toPdf(formatedFilename,userId){
    console.log("fetching... pdf from php!")
    const browser = await puppeteer.launch({args: ['--no-sandbox', '--disable-setuid-sandbox']});
    // Create a new page
    const page = await browser.newPage();
    // Website URL to export as pdf
    const website_url = 'http://php-apache/controller/cron/format_to_email_invoice.php?idc='+userId; 
    // Open URL in current page
    //try catch 
    await page.goto(website_url, { waitUntil: 'networkidle0' }); 
    //To reflect CSS used for screens instead of print
    await page.emulateMediaType('screen');
    // Downlaod the PDF
    const pdf = await page.pdf({
        path: 'pdf/'+formatedFilename,
        margin: { top: '100px', right: '50px', bottom: '100px', left: '50px' },
        printBackground: true,
        format: 'A4',
    });
    console.log("voy a cerrar el browser")
    await browser.close();
    console.log("browser CERRADO!") 
    return true;
}


module.exports={
    toPdf
}
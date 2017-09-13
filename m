Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsDH2-000529-Pa
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 19:24:38 +0000
Received: by mail-wr0-x234.google.com with SMTP id v109so2484226wrc.1
 for <ath10k@lists.infradead.org>; Wed, 13 Sep 2017 12:24:14 -0700 (PDT)
Subject: Re: failed to fetch board data QCA6174
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <8b76e913-1205-db34-915b-658fdc017afe@gmail.com>
 <54ec1899-7db8-088f-e2a9-dc5e532d0cea@qti.qualcomm.com>
From: Luka Karinja <luka.karinja@gmail.com>
Message-ID: <bb17d89c-3757-1f57-801e-eee70380ad09@gmail.com>
Date: Wed, 13 Sep 2017 21:24:10 +0200
MIME-Version: 1.0
In-Reply-To: <54ec1899-7db8-088f-e2a9-dc5e532d0cea@qti.qualcomm.com>
Content-Language: en-US
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/13/2017 09:00 AM, Ryan Hsu wrote:
> On 09/12/2017 10:59 PM, Luka Karinja wrote:
>
>> Hello. Its a module from ebay. So probably i can't do much with it without the right board.bin?
>>
>> this is the module: http://www.ebay.com/itm/Qualcomm-Atheros-QCA6174-QCNFA344A-NGFF-M-2-WIFI-Card-BT4-1-WLAN-Wireless-Blueto/182599401035?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649#viTabs_0
> Not sure would this works, can you please try to take the driver from here and extract the files.
>
> https://drp.su/en/hwids/PCI%5CVEN_168C%26DEV_003E%26SUBSYS_C14F144D%26REV_32
>
>  From the inf, QCNFA344A likely is using eeprom_ar6320_3p0_NFA344a.bin (assumed is NFA364A equivalent), rename it to board.bin to see if that works?
>
i did try:
eeprom_ar6320_3p0_NFA344a.bin
eeprom_ar6320_3p0_NFA344a_BLP.bin
eeprom_ar6320_3p0_NFA344A_power1213.bin
with the same calibration not found errors

so if i understand correctly, the only way to get it working is with 
manufacturers board.bin?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

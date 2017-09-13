Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ds1fT-0002Bx-Mq
 for ath10k@lists.infradead.org; Wed, 13 Sep 2017 07:01:06 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: failed to fetch board data QCA6174
Date: Wed, 13 Sep 2017 07:00:41 +0000
Message-ID: <54ec1899-7db8-088f-e2a9-dc5e532d0cea@qti.qualcomm.com>
References: <c1f6096c-7445-7862-a5df-b96211be9df3@gmail.com>
 <8d3a8d6f-5191-d1fa-784b-28cab8b407d5@qti.qualcomm.com>
 <e87292ba-a00c-edf9-2c02-5be14750bb60@gmail.com>
 <d4b43397-3267-abff-fbc1-48cbd9d58073@qti.qualcomm.com>
 <8b76e913-1205-db34-915b-658fdc017afe@gmail.com>
In-Reply-To: <8b76e913-1205-db34-915b-658fdc017afe@gmail.com>
Content-Language: en-US
Content-ID: <82F7454D4AF73A49A21890067A339DAF@qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Luka Karinja <luka.karinja@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/12/2017 10:59 PM, Luka Karinja wrote:

> Hello. Its a module from ebay. So probably i can't do much with it without the right board.bin?
>
> this is the module: http://www.ebay.com/itm/Qualcomm-Atheros-QCA6174-QCNFA344A-NGFF-M-2-WIFI-Card-BT4-1-WLAN-Wireless-Blueto/182599401035?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2057872.m2749.l2649#viTabs_0

Not sure would this works, can you please try to take the driver from here and extract the files.

https://drp.su/en/hwids/PCI%5CVEN_168C%26DEV_003E%26SUBSYS_C14F144D%26REV_32

From the inf, QCNFA344A likely is using eeprom_ar6320_3p0_NFA344a.bin (assumed is NFA364A equivalent), rename it to board.bin to see if that works?

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

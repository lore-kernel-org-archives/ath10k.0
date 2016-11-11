Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c5AcR-00056r-Td
 for ath10k@lists.infradead.org; Fri, 11 Nov 2016 12:07:44 +0000
Received: by mail-wm0-x241.google.com with SMTP id a20so9018358wme.2
 for <ath10k@lists.infradead.org>; Fri, 11 Nov 2016 04:07:22 -0800 (PST)
Received: from [192.168.0.155] ([141.20.213.139])
 by smtp.gmail.com with ESMTPSA id w66sm18612027wme.4.2016.11.11.04.07.20
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Nov 2016 04:07:20 -0800 (PST)
Message-ID: <5825B478.4020405@gmail.com>
Date: Fri, 11 Nov 2016 13:07:20 +0100
From: Felix <kramerfe@gmail.com>
MIME-Version: 1.0
Subject: Connection Problems with  on QCA9880-BR4A
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
To: ath10k@lists.infradead.org

Hello,

I am running a Debian Jessie server on the backports kernel 
4.7.0-0.bpo.1-amd64. An Ubiquiti SR71 with its AR928X is working just 
fine under ath9k.

The mikrotik R11e-5HacT with its  QCA9880-BR4A is recognized after some 
errors trying to load inexistent files with the standard firmware-5.bin 
from the Jessie Backports (10.2.4.70.54):
...ath10k_pci 0000:02:00.0: firmware: failed to load 
ath10k/pre-cal-pci-0000:02:00.0.bin (-2)
...ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
...ath10k_pci 0000:02:00.0: firmware: failed to load 
ath10k/cal-pci-0000:02:00.0.bin (-2)
...ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/cal-pci-0000:02:00.0.bin failed with error -2
...ath10k_pci 0000:02:00.0: firmware: failed to load 
ath10k/QCA988X/hw2.0/board-2.bin (-2)
...ath10k_pci 0000:02:00.0: Direct firmware load for 
ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
There are many reports on working devices with these errors on the web 
so I suppose they can be ignored.

The device seems to work (iw scan shows better results than the SR71), 
but after connection to the AP via wpa_supplicant, dhclient is unable to 
retrieve an IP-adress. I have tried the newer firmware (10.2.4.70.58) 
and the older ones as well as those from candela without success. On 
older firmwares additional errors up to firmware crash on iw set 
bitrates appear.


Regards,
Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

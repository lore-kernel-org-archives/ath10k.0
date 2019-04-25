Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJim0-0004mg-SP
 for ath10k@lists.infradead.org; Thu, 25 Apr 2019 18:07:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id u57so714120edm.3
 for <ath10k@lists.infradead.org>; Thu, 25 Apr 2019 11:07:00 -0700 (PDT)
Received: from ?IPv6:2a02:8084:42e2:500:9eb6:d0ff:fed1:3d65?
 ([2a02:8084:42e2:500:9eb6:d0ff:fed1:3d65])
 by smtp.gmail.com with ESMTPSA id c4sm230822ejo.51.2019.04.25.11.06.57
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Apr 2019 11:06:57 -0700 (PDT)
From: Cyril Duez <cyril.duez@gmail.com>
Subject: QCA6174 disconnect over 5Ghz wifi.
Message-ID: <2d51a190-1017-7d73-3012-ba49116e9028@gmail.com>
Date: Thu, 25 Apr 2019 19:06:55 +0100
MIME-Version: 1.0
Content-Language: en-IE
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

Hello ath10k firmware maintainers,

I am having some trouble with my wifi card recently, it looks like I am 
getting disconnected when my card uses the 5Ghz wifi.

At first everything works perfectly normal but then i am unable to ping 
my local gateway. Nothing shows up in the dmesg log and after 3/4 
minutes I got this:

# dmesg

avril 24 19:42:27 banquise kernel: wlan0: deauthenticated from 
38:43:7d:1b:c7:21 (Reason: 4=DISASSOC_DUE_TO_INACTIVITY)


I tested several things and found that the disconnection is not 
completely random: if I load a web page with a streaming video and i 
successively change the stream position several times it will trigger 
the issue. I know it's strange and it might be a coincidence but i did 
reproduce it successfully several times with this method while i was not 
able to do so when connected to the 2.4Ghz wifi.

I tried to change the channel of the 5Ghz but with no avail.

Here's some information about the firmware I am using:


# sudo ethtool -i wlan0

driver: ath10k_pci
version: 5.0.2-arch1-1-ARCH
firmware-version: RM.4.4.1.c2-00057-QCARMSWP-1
expansion-rom-version:
bus-info: 0000:3a:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no


I will try to activate the firmware's log.

If you need additional information or if you have any advice, let me know!

Thanks,

Cyril.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

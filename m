Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from torres.puc.rediris.es ([2001:720:418:ca00::22])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNKuv-000866-Nl
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 14:13:42 +0000
Received: from [84.88.62.208] (helo=leo)
 by torres.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <ipascual@cttc.cat>) id 1bNKuR-0003MU-Q5
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 16:13:08 +0200
Received: from [10.1.16.22] (pcipascual.cttc.es [10.1.16.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 3C2BB1FF67
 for <ath10k@lists.infradead.org>; Wed, 13 Jul 2016 16:13:06 +0200 (CEST)
From: =?UTF-8?Q?I=c3=b1aki_Pascual?= <ipascual@cttc.cat>
Subject: How to obtain Link Quality information
Message-ID: <57864BEA.4090202@cttc.cat>
Date: Wed, 13 Jul 2016 16:10:50 +0200
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi everyone,

I am trying to get link quality information from an 802.11ac interface 
and it looks like the only way is to use "iw wlan2 scan". I don't like 
this solution as it scans all channels and takes a while.

If I try "cat /proc/net/wireless" (this would be my preferred option) 
the output is empty and I am not able to get this information with any 
other tool. Below is the output for some commands I tried.

I am using kernel 4.2 with ath10k and Candela firmware 10.1 on a 
Qualcomm Atheros QCA988x

Any ideas on how can I get the link quality information?

Thanks,

Inaki

===============================
monet@sc229:~$ ethtool -i wlan2
driver: ath10k_pci
version: 4.2.0+
firmware-version: 10.1.467-ct-_fH-016-b797ef5
bus-info: 0000:0b:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: no
supports-priv-flags: no
monet@sc229:~$
===============================
monet@sc229:~$ cat /proc/net/wireless
Inter-| sta-|   Quality        |   Discarded packets               | 
Missed | WE
  face | tus | link level noise |  nwid  crypt   frag  retry   misc | 
beacon | 22
monet@sc229:~$

===============================
monet@sc229:~$ iwconfig wlan2
wlan2     IEEE 802.11abgn  ESSID:"SC228SC229"
           Mode:Ad-Hoc  Frequency:5.24 GHz  Cell: 8E:CE:DE:4F:86:95
           Tx-Power=17 dBm
           Retry short limit:7   RTS thr:off   Fragment thr:off
           Power Management:on

monet@sc229:~$
===============================
monet@sc229:~$ iw wlan2 link
Joined IBSS 8e:ce:de:4f:86:95 (on wlan2)
     SSID: SC228SC229
     freq: 5240
monet@sc229:~$
===============================

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

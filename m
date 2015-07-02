Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAcVv-0006PG-OL
 for ath10k@lists.infradead.org; Thu, 02 Jul 2015 11:18:44 +0000
Received: from [2001:40b0:7c22:6020:c74:d7ce:f88c:831b] (helo=leo)
 by rudy.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jose.nunez@cttc.cat>) id 1ZAcVV-00062c-JU
 for ath10k@lists.infradead.org; Thu, 02 Jul 2015 13:18:18 +0200
Received: from [10.1.16.14] (pcjnunez.cttc.es [10.1.16.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 484CA1FDBD
 for <ath10k@lists.infradead.org>; Thu,  2 Jul 2015 13:18:13 +0200 (CEST)
Message-ID: <55951DF8.6000708@cttc.cat>
Date: Thu, 02 Jul 2015 13:18:16 +0200
From: =?UTF-8?B?Ikpvc2UgTsO6w7Flei1NYXJ0w61uZXogKENUVEMpIg==?=
 <jose.nunez@cttc.cat>
MIME-Version: 1.0
Subject: ath10k: firmware crash after setting promiscous mode
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

Hi all,
I'm trying to use an ath10k in IBSS mode with 2 wireless cards based on 
qca988x . I'd like to be able to put the wireless cards in promiscuous 
mode (ifconfig wlanX promisc). When I put the wireless cards in 
promiscuous mode, the firmware crashes. Has anyone tried this?

Kernel is 4.1 and  firmware is 999.999.0.636. Please find below the 
ath10k crash info:

[14940.115607] ath10k_pci 0000:0c:00.0: firmware crashed! (uuid 
1f927b1a-d148-45ce-83f8-df3ba23fb473)
[14940.115626] ath10k_pci 0000:0c:00.0: qca988x hw2.0 (0x4100016c, 
0x043202ff) fw 999.999.0.636 api 4 htt 2.1 wmi 1 cal otp max_sta 16
[14940.115632] ath10k_pci 0000:0c:00.0: debug 0 debugfs 1 tracing 1 dfs 
0 testmode 0
[14940.117633] ath10k_pci 0000:0c:00.0: firmware register dump:
[14940.117640] ath10k_pci 0000:0c:00.0: [00]: 0x4100016C 0x00000000 
0x009C4521 0x00000000
[14940.117646] ath10k_pci 0000:0c:00.0: [04]: 0x009C4521 0x00060330 
0x00000019 0x00955A00
[14940.117650] ath10k_pci 0000:0c:00.0: [08]: 0x001F1294 0x00000000 
0x0040CC94 0x00000020
[14940.117655] ath10k_pci 0000:0c:00.0: [12]: 0x00000000 0x00000000 
0x00958360 0x0095836B
[14940.117660] ath10k_pci 0000:0c:00.0: [16]: 0x809A0978 0x0040AD94 
0x00439304 0x0040D074
[14940.117664] ath10k_pci 0000:0c:00.0: [20]: 0x0000FFFF 0x00000000 
0x0042E704 0x00000000
[14940.117669] ath10k_pci 0000:0c:00.0: [24]: 0x809A0978 0x0040AD94 
0x00439304 0x7C4A5357
[14940.117674] ath10k_pci 0000:0c:00.0: [28]: 0x809AD1A2 0x0040ADE4 
0x00439304 0x0043F68C
[14940.117678] ath10k_pci 0000:0c:00.0: [32]: 0x809B01DA 0x00000000 
0x00410110 0x0041937C
[14940.117685] ath10k_pci 0000:0c:00.0: [36]: 0x00000000 0x00000000 
0x00000000 0x00000000
[14940.117690] ath10k_pci 0000:0c:00.0: [40]: 0x00000000 0x00000000 
0x00000000 0x00412700
[14940.117694] ath10k_pci 0000:0c:00.0: [44]: 0x00439BB8 0x00000000 
0x00000000 0x00400000
[14940.117699] ath10k_pci 0000:0c:00.0: [48]: 0x809AE0B4 0x0040AE04 
0x00400000 0x0043F68C
[14940.117703] ath10k_pci 0000:0c:00.0: [52]: 0x00000001 0x00000000 
0x004231F0 0x00400000
[14940.117707] ath10k_pci 0000:0c:00.0: [56]: 0x809AE17E 0x0040AE44 
0x0040FE6C 0x0040D310


Thanks,
Jose


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailsrv0.aau.at ([143.205.180.48] helo=mailsrv.uni-klu.ac.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEeNd-0006Rt-Ln
 for ath10k@lists.infradead.org; Tue, 05 Aug 2014 13:02:23 +0000
Received: from mailsrv.uni-klu.ac.at (localhost [127.0.0.1])
 by mailsrv.uni-klu.ac.at (Postfix) with ESMTP id 879D9161527
 for <ath10k@lists.infradead.org>; Tue,  5 Aug 2014 14:59:49 +0200 (CEST)
Received: from exmbx1.ad.aau.at (exmbx1.ad.aau.at [143.205.64.225])
 by mailsrv.uni-klu.ac.at (Postfix) with ESMTPS id 7C176161514
 for <ath10k@lists.infradead.org>; Tue,  5 Aug 2014 14:59:49 +0200 (CEST)
From: "Hayat, Samira" <Samira.Hayat@aau.at>
Subject: ath10k with hostapd
Date: Tue, 5 Aug 2014 12:59:50 +0000
Message-ID: <9087ccfa9e9346eb808c2b0f61259744@exmbx1.ad.aau.at>
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

I have been trying to get hostapd running for 80211ac. I have a card
that supports n/ac. I used backports to get ath10k running on my kernel.
the output of

lsmod | grep ath10k

is:

ath10k_pci             41185     0 
ath10k_core           137353  1 ath10k_pci
mac80211              613458  1 ath10k_core
ath                           28966    1 ath10k_core
cfg80211                 586956  3 ath10k_core,mac80211,ath
compat                    29841    3 ath10k_pci,mac80211,cfg80211

I have tried running hostapd with config_80211n and config_80211ac
enabled in the .config file. Even having done that, I get

Configuration file: ./hostapd-minimal.conf
Line 8: unknown configuration item 'ht_capab'
Line 9: unknown configuration item 'ieee80211n'
Line 10: unknown configuration item 'ieee80211ac'
Line 11: unknown configuration item 'vht_oper_chwidth'
Line 12: unknown configuration item 'vht_oper_centr_freq_seg0_idx'
5 errors found in configuration file './hostapd-minimal.conf'
Failed to set up interface with ./hostapd-minimal.conf
Failed to initialize interface

when I try to run hostapd-minimal.conf (minimal configuration taken from
wireless linux webpage for ath10k). Any help would be highly appreciated.

Samira


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

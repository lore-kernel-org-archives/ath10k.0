Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp2.ugent.be ([157.193.49.126])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YjQLw-0002h9-GE
 for ath10k@lists.infradead.org; Sat, 18 Apr 2015 10:52:01 +0000
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
 by smtp2.ugent.be (Postfix) with ESMTP id CAF0512C434
 for <ath10k@lists.infradead.org>; Sat, 18 Apr 2015 12:51:32 +0200 (CEST)
Received: from smtp2.ugent.be ([IPv6:::ffff:157.193.49.126])
 by localhost (mcheck2.UGent.be [::ffff:157.193.43.11]) (amavisd-new,
 port 10024)
 with ESMTP id xhFJeNc-l0-a for <ath10k@lists.infradead.org>;
 Sat, 18 Apr 2015 12:51:32 +0200 (CEST)
Received: from lionel.ugent.be (lionel.ugent.be [157.193.47.118])
 by smtp2.ugent.be (Postfix) with ESMTP id 7D38C12C42F
 for <ath10k@lists.infradead.org>; Sat, 18 Apr 2015 12:51:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lionel.ugent.be (Postfix) with ESMTP id 6452D9582F
 for <ath10k@lists.infradead.org>; Sat, 18 Apr 2015 12:51:32 +0200 (CEST)
Date: Sat, 18 Apr 2015 12:51:32 +0200
Message-ID: <20150418125132.Horde.n2KkWFDIVCdVMjc0WZqgldA@webmail.ugent.be>
From: Louis Desfossez <Louis.Desfossez@UGent.be>
Subject: Set vht transmission parameters using radiotap header
MIME-Version: 1.0
Content-Disposition: inline
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Using the click modular router project we are trying to inject packets  
on an Atheros QCA988x in monitor mode. Wireless parameters (nss, mcs,  
channel, guard interval, channel width and tx power) are set in the  
radiotap header.
Which parameters can currently be read by the ath10k/mac80211 driver  
and be set for transmission (ie. IEEE_RADIOTAP_DBM_TX_POWER,  
IEEE_RADIOTAP_CHANNEL)?
Is there a possibility to handle the vht information (ie.  
IEEE80211_RADIOTAP_VHT_MCS, IEEE80211_RADIOTAP_VHT_NSS)?


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

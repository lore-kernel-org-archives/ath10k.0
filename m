Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x229.google.com ([2607:f8b0:4003:c06::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XZmWK-0003F8-3M
 for ath10k@lists.infradead.org; Thu, 02 Oct 2014 19:58:36 +0000
Received: by mail-oi0-f41.google.com with SMTP id u20so2470557oif.0
 for <ath10k@lists.infradead.org>; Thu, 02 Oct 2014 12:58:15 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Oct 2014 00:58:15 +0500
Message-ID: <CADxDmp50X2XnBjfk5qJKRH-n=1Cwagmjb_XyD+RJ4AgpPh-kjQ@mail.gmail.com>
Subject: Dynamic channel Access
From: Kamran Nishat <kamran.nishat@gmail.com>
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
To: ath10k@lists.infradead.org

Hi,
To deal with co-channel interference 802.11ac standard propose Dynamic
channel access. It means if my AP is configured on 40MHz, but it sense
only its primary 20Mhz channel is free then it will dynamically
changes its channel width to 20MHz and starts sending.

Is dynamic channel access implemented in Atheros based 802.11ac chips?


Regards
Kamran

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

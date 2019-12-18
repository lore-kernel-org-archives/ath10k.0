Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihNKb-0004HK-Sv
 for ath10k@lists.infradead.org; Wed, 18 Dec 2019 00:36:52 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 6so178304oix.7
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 16:36:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKR_QVLabBXcsPfcCt8MdQXUrkgw5aNVAJD9XUke-G7XhsTwAA@mail.gmail.com>
References: <CAKR_QVLabBXcsPfcCt8MdQXUrkgw5aNVAJD9XUke-G7XhsTwAA@mail.gmail.com>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Wed, 18 Dec 2019 01:36:47 +0100
Message-ID: <CAKR_QVK2fJkR6OveFAhcjqjToh_mJMxfvjD6vJssqVtpmbQkGA@mail.gmail.com>
Subject: Re: [RFC] ath10k: possible RSSI recalibration bug?
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
To: ath10k <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>

some more testing revealed it might be NF related bug:
https://marc.info/?l=linux-wireless&m=157662586107288&w=2

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

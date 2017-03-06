Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cktla-0001JJ-RT
 for ath10k@lists.infradead.org; Mon, 06 Mar 2017 14:37:43 +0000
Received: by mail-oi0-x22f.google.com with SMTP id m124so85862404oig.1
 for <ath10k@lists.infradead.org>; Mon, 06 Mar 2017 06:37:18 -0800 (PST)
MIME-Version: 1.0
From: Chris Price <chris.price@dejero.com>
Date: Mon, 6 Mar 2017 09:37:17 -0500
Message-ID: <CALJ2kaG9Q-_XVi=GrXRZZwRa4Ptd1yMj4tpShEqxB2k2MKXjdQ@mail.gmail.com>
Subject: Re: 4.9 Kernel panic on ACS and intermittent ability to host AP
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

> You might want to apply this one - https://patchwork.kernel.org/patch/9486941/

> As mentioned, please try the new firmware again.

This has been working for me so far (patch + new firmware). The only
unusual behaviour I've seen is that the 5 GHz AP seems to fail to
start on the first try after boot, but then works thereafter.
Obviously this can be worked around. I have yet to see a panic.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

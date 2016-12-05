Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDwzz-0004FE-Du
 for ath10k@lists.infradead.org; Mon, 05 Dec 2016 17:24:20 +0000
Received: by mail-io0-x243.google.com with SMTP id s82so1199044ioi.3
 for <ath10k@lists.infradead.org>; Mon, 05 Dec 2016 09:23:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5845827B.2000000@candelatech.com>
References: <1480645800-2148-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQkEaC-ZSbeK=JB=q+ucF1PWcEQXkJEp6JYv4pfOf35cHg@mail.gmail.com>
 <1480945950.31788.4.camel@sipsolutions.net> <58458058.5020008@candelatech.com>
 <1480950054.31788.36.camel@sipsolutions.net>
 <5845827B.2000000@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 5 Dec 2016 09:23:56 -0800
Message-ID: <CAJ-VmokNztn7Rj4jTxYo2QR0vL0-t6h7M5qLKUSMn2-VtAN2bA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mac80211: do not iterate active interfaces when in
 re-configure
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
To: Ben Greear <greearb@candelatech.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

fwiw, I'm facing the same kinds of cleanup problems with my port of
(oct 2015) ath10k to freebsd.

The oct 2015 ath10k tree doesn't have the firmware per-txq/tid/peer
feedback stuff in it, so this hasn't yet bitten me, but there rest of
the races have - mostly surrounding handling pending TX frames when a
VAP is deleted (vdev/interface in ath10k/mac80211 language) and if any
TX frames were stuck. Stuck TX frames happens more often than I'd like
because of how earlier firmware required peer entries to first appear
in the hardware.

Maybe we need some kind of lifecycle checkpoint for things like peer
addition/removal (for the txq issues ben had before) and the ability
to ask the firmware to stop/flush HTT TX and re-start it. That way we
can cleanly add/remove interfaces at any point without worrying about
any dangling frames in the transmit queue waiting for completion.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

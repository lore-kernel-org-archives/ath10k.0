Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-f180.google.com ([209.85.128.180])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fENyQ-0002WK-5k
 for ath10k@lists.infradead.org; Thu, 03 May 2018 23:49:19 +0000
Received: by mail-wr0-f180.google.com with SMTP id f2-v6so7462165wrm.3
 for <ath10k@lists.infradead.org>; Thu, 03 May 2018 16:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
In-Reply-To: <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 03 May 2018 23:48:53 +0000
Message-ID: <CAJ-VmonSEuh7Ou=K9Gu-gZ5ikpX9H=nzXe9NssNu1vw8fEk3hg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
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
To: srirrama@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi,

May we have a little more information about how this is supposed to work?

It looks like we're supposed to send the information about the matched
radar pattern back to the firmware for confirmation? What's the intended
behaviour from the firmware? Will the firmware have a hard-coded set of
patterns we have to answer in/by?

I ask (like Peter, we work together) because we've had to tweak this
behaviour a little to actually pass FCC / ETSI DFS certification. My
general concern is that this'll cause a lot of false detects on boards that
haven't had things tweaked for the given board. As far as I'm aware the DFS
parameters are still hard-coded into the firmware image so if you have to
change those you're SOL without the relevant NDAs - this makes running the
open source DFS stuff a little tricksy on vendor boards.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

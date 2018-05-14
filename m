Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIIAb-0003Ap-Ub
 for ath10k@lists.infradead.org; Mon, 14 May 2018 18:26:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: DFS Host Confirmation
References: <1525110339-25326-1-git-send-email-srirrama@codeaurora.org>
 <1525110339-25326-3-git-send-email-srirrama@codeaurora.org>
 <CAJ-VmonSEuh7Ou=K9Gu-gZ5ikpX9H=nzXe9NssNu1vw8fEk3hg@mail.gmail.com>
Date: Mon, 14 May 2018 21:25:46 +0300
In-Reply-To: <CAJ-VmonSEuh7Ou=K9Gu-gZ5ikpX9H=nzXe9NssNu1vw8fEk3hg@mail.gmail.com>
 (Adrian Chadd's message of "Thu, 03 May 2018 23:48:53 +0000")
Message-ID: <87h8naqel1.fsf@kamboji.qca.qualcomm.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: linux-wireless@vger.kernel.org, srirrama@codeaurora.org, ath10k@lists.infradead.org

Adrian Chadd <adrian@freebsd.org> writes:

> May we have a little more information about how this is supposed to work?
>
> It looks like we're supposed to send the information about the matched
> radar pattern back to the firmware for confirmation? What's the intended
> behaviour from the firmware? Will the firmware have a hard-coded set of
> patterns we have to answer in/by?

That's really an implementation detail inside the firmware and from
ath10k point of view we don't care what checks the firmware has, we just
provide all the necessary information. The checks in firmware might even
change in later releases.

> I ask (like Peter, we work together) because we've had to tweak this
> behaviour a little to actually pass FCC / ETSI DFS certification. My
> general concern is that this'll cause a lot of false detects on boards that
> haven't had things tweaked for the given board. As far as I'm aware the DFS
> parameters are still hard-coded into the firmware image so if you have to
> change those you're SOL without the relevant NDAs - this makes running the
> open source DFS stuff a little tricksy on vendor boards.

This shouldn't cause more false detections, the pattern detection from
ath.ko is still used as before. The firmware will just disable DFS
altogether if it thinks ath10k is not compliant.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

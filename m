Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s72.web-hosting.com ([198.187.29.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB8fn-0001zp-S9
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 21:06:48 +0000
From: Sujith Manoharan <sujith@msujith.org>
MIME-Version: 1.0
Message-ID: <21685.35179.110539.780864@gargle.gargle.HOWL>
Date: Wed, 14 Jan 2015 02:38:59 +0530
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
In-Reply-To: <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <87r3uy4t9y.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo wrote:
> I'm not sure if I really like this path of having interfaces to
> configure driver internals. I suspect that if we add this, we will have
> even more later. It's a lot more documenting for us and more work to the
> users to understand what parameters they should use. Also this means
> that testing will be more challenging as people will use different
> values and results won't be comparable.
> 
> Isn't there any other way to solve the problem? Like automatically
> changing the value somehow (no idea how) or some other means?

We are limiting performance by restricting the fill size. A user
will just use the default, which is still the same and remains
unchanged. But, having a way to adjust this based on the platform
seems reasonable to me and I think trying to change this value dynamically
is overkill.

> Or if nothing else helps, a crazy idea is to have some sort of platform
> profile parameter:
> 
> 0 = auto
> 1 = slow
> 2 = fast
> 3 = superfast (x86)
> 
> And then we would have preset values (not just htt_fill_size) within
> ath10k and they get chosen based on the profile configured.

I don't think a network driver should limit its performance with
such profiles. Moreover, x86 can be slow too - at least, my 4 year
old machine is. :-)

Sujith

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

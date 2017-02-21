Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgFLW-000160-6f
 for ath10k@lists.infradead.org; Tue, 21 Feb 2017 18:39:37 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k regression on XPS13
References: <alpine.LSU.2.20.1702201508280.24579@cbobk.fhfr.pm>
 <CA+55aFxLmgA7drrGfUJmCRPT-A74ROYf6GQHFGO5pzVjZ0dL7Q@mail.gmail.com>
 <87d1eb99dq.fsf_-_@purkki.adurom.net>
 <20170221.131858.949421414784612398.davem@davemloft.net>
Date: Tue, 21 Feb 2017 20:38:48 +0200
In-Reply-To: <20170221.131858.949421414784612398.davem@davemloft.net> (David
 Miller's message of "Tue, 21 Feb 2017 13:18:58 -0500 (EST)")
Message-ID: <87y3wzbd8n.fsf@kamboji.qca.qualcomm.com>
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
To: David Miller <davem@davemloft.net>
Cc: linux-wireless@vger.kernel.org, jikos@kernel.org, torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

David Miller <davem@davemloft.net> writes:

> From: Kalle Valo <kvalo@codeaurora.org>
> Date: Tue, 21 Feb 2017 11:32:49 +0200
>
>> We are working on a fix so that ath10k continues to work with older
>> board-2.bin, but that might take a day or two still.
>
> Kalle I really wanted to send my net-next pull request to Linus later
> today.  But I guess I have to wait for this ath10k first.
>
> Please get this to me as soon as possible, thanks.

We have a fix now but it's not really tested that well so I'm reluctant
to submit it yet. As I don't want to make you wait I think I'll submit
you a patch reverting f2593cb1b291 in an hour or two. And later in the
week I send you a properly fixed (and tested) version of f2593cb1b291.

Does that sound ok to you?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

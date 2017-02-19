Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfS8o-0005Z8-Bk
 for ath10k@lists.infradead.org; Sun, 19 Feb 2017 14:07:09 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 0/8] ath10k sdio support
Date: Sun, 19 Feb 2017 14:05:42 +0000
Message-ID: <87y3x2ff7y.fsf@kamboji.qca.qualcomm.com>
References: <7b204d34-b791-ea78-cf4e-90e8fe1b79fb@gmail.com>
 <5a3ad65a-8cc0-ab1a-dc95-a5fd31035bd7@gmail.com>
In-Reply-To: <5a3ad65a-8cc0-ab1a-dc95-a5fd31035bd7@gmail.com> (Erik
 Stromdahl's message of "Sun, 19 Feb 2017 14:52:14 +0100")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Hsu,
 Ryan" <ryanhsu@qca.qualcomm.com>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> I just noticed that Ryan Hsu submitted two patches containing similar
> functionality to what I have in my tree on github. They have not been
> integrated in the ath master yet, but they have been added to master-pending.
>
> Below are the commits I am talking about
>
> bc1054a15be3c962c83aa22476a3e9c1266da792 ath10k: improve the firmware
> download time for QCA9377
> db5af2a25bd8c1410ec4456d1d4f4e6ded2649ca ath10k: improve the firmware
> download time for QCA6174
>
> Since some of my patches overlap with these I think it would be best if
> I add these to my tree and rewrite my patches.
>
> If they haven't made it into master before I submit my updated patch series
> I will include them in my set.
>
> Is this OK?
>
> If they will be added to master soon there is no issue since I will of course
> rebase to the latest ath-YYYYMMDDHHmm before I submit anything.

That's ok, just mention this in the cover letter.

Even better is that if you can use master-pending from ath.git as the
baseline (compared to the master branch normally recommended), Ryan's
patches are there now. That way you don't need to apply anything extra
to your tree. But I'm hoping to apply Ryan's patches soon anyway.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

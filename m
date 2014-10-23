Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhJ6b-0002U1-NZ
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 14:11:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: remove tsf argument from rx_desc tracing
References: <1413899700-10717-1-git-send-email-michal.kazior@tieto.com>
 <1413899700-10717-2-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQmr=uZNeqKxoHM5sG2EU7sBfdETXvzuXkNxDjTJ9ANAbg@mail.gmail.com>
Date: Thu, 23 Oct 2014 17:10:31 +0300
In-Reply-To: <CA+BoTQmr=uZNeqKxoHM5sG2EU7sBfdETXvzuXkNxDjTJ9ANAbg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 22 Oct 2014 10:46:43 +0200")
Message-ID: <878uk6q3l4.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 21 October 2014 15:54, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Fundamtenally this was wrong. Tsf is only valid
>> in first MPDU of a PPDU. This means tsf value was
>
> s/first MPDU/last MPDU/
>
> I must've had a brain fart when writing the commit log yesterday.
>
> @Kalle: Should I re-spin or will you fix it before applying?

No need to re-spin, I edited the commit log in ath-next-test. I also
fixed a typo in "fundamentally".

commit d75153c577ddfffa9e7438e8225dfaf564f34552
Author: Michal Kazior <michal.kazior@tieto.com>
Date:   Thu Oct 23 17:04:27 2014 +0300

    ath10k: remove tsf argument from rx_desc tracing
    
    Fundamentally this was wrong. Tsf is only valid
    in last MPDU of a PPDU. This means tsf value was
    wrong most of the time during heavy traffic.
    
    Also I don't see much point in exposing a
    redundant (and broken) tsf value. Userspace can
    already read it from the dumped rx descriptor
    buffer.
    
    Cc: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
    Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

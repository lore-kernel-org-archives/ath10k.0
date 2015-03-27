Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbTah-00038V-8f
 for ath10k@lists.infradead.org; Fri, 27 Mar 2015 12:42:24 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 1/6] ath10k: unify tx mode and dispatch
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-2-git-send-email-marek.puzyniak@tieto.com>
 <CA+BoTQm74JDvMk=G2Hot7h4v4gU4gRh8JH0K=1yhMa_UGQ4e0A@mail.gmail.com>
 <CA+BoTQmk+KzhO1xa3AP9tiDnEVG36OD5WoV+VwRCtvSF1sEtMw@mail.gmail.com>
Date: Fri, 27 Mar 2015 14:41:44 +0200
In-Reply-To: <CA+BoTQmk+KzhO1xa3AP9tiDnEVG36OD5WoV+VwRCtvSF1sEtMw@mail.gmail.com>
 (Michal Kazior's message of "Thu, 26 Mar 2015 11:03:08 +0100")
Message-ID: <87wq227gtz.fsf@kamboji.qca.qualcomm.com>
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
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 26 March 2015 at 10:27, Michal Kazior <michal.kazior@tieto.com> wrote:
>> On 20 March 2015 at 12:02, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
>>> From: Michal Kazior <michal.kazior@tieto.com>
>>>
>>> There are a few different tx paths depending on
>>> firmware and frame itself.
>>>
>>> Creating a uniform decision will make it possible
>>> to switch between different txmode easier, both
>>> for testing and for future features as well.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>> [...]
>>
>> This patch apparently breaks AP operation. I need to investigate this.
>
> Ok - htt.freq missed clearing and in some cases it contained garbage
> leading to HTT discarding packets.
>
> @Kalle: I've posted a patch `ath10k: clear htt.freq` which addresses
> the problem separately. Please apply it _before_ you apply TDLS
> patches (which are fine, including this patch) to avoid breakage
> in-between commits.

Ack, I'll do that. Thanks for fixing this.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

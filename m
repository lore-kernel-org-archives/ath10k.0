Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRM32-0008Aa-62
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 13:01:00 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix scheduling while atomic bug on config
References: <1380707467-30387-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQnQVE_YUrrtfFCeQSj4tmccbA9cG_ZMdHisx4C-mJfqkg@mail.gmail.com>
Date: Wed, 2 Oct 2013 16:00:05 +0300
In-Reply-To: <CA+BoTQnQVE_YUrrtfFCeQSj4tmccbA9cG_ZMdHisx4C-mJfqkg@mail.gmail.com>
 (Michal Kazior's message of "Wed, 2 Oct 2013 13:18:12 +0200")
Message-ID: <87pprn25gq.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 2 October 2013 11:51, Michal Kazior <michal.kazior@tieto.com> wrote:
>> Recent WMI/HTC changes introduces this bug because
>> now WMI commands can sleep.
>>
>> Use appropriate interface iteration function.
>>
>> Reported-By: Kalle Valo <kvalo@qca.qualcomm.com>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> Self NACK.
>
> I've posted this too soon. This patch can lead to deadlocks on
> iflist_mtx in some cases.

Ok, thanks for letting me know. I'll drop the patch from my queue.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

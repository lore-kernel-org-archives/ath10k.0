Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYVYw-0003UU-MF
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 07:40:03 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: fix fw stats processing
References: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
 <1411641230-18785-5-git-send-email-michal.kazior@tieto.com>
 <8761g94hm4.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmC7vec3OW8ZbCvkx761cMtUTT6f+UAVp7dMXj2hNRKUA@mail.gmail.com>
Date: Mon, 29 Sep 2014 10:38:59 +0300
In-Reply-To: <CA+BoTQmC7vec3OW8ZbCvkx761cMtUTT6f+UAVp7dMXj2hNRKUA@mail.gmail.com>
 (Michal Kazior's message of "Mon, 29 Sep 2014 09:16:14 +0200")
Message-ID: <87iok63mgc.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 27 September 2014 10:01, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> If stat data exceeds wmi-htc buffer limits
>>> firmware splits it into many wmi stats update
>>> events which are delivered in a ping-pong fashion
>>> triggered by wmi stats request command.
>>>
>>> Since there's only an implicit start-of-data and
>>> no end-of-data indications the driver has to
>>> perform some trickery to get complete stat data.
>>>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>
>> I folded the patch below in ath-next-next. Please check:
>>
>> https://github.com/kvalo/ath/commit/7071112c5ddaff761cd7d9bb3110c3f3d2f83bb8
> [...]
>
> I think you meant:
>
>   https://github.com/kvalo/ath/commit/5122a60f4fbf5a38e70a14578858b39058ee367a

Indeed. Sorry for the mixup.

> It looks good. Thanks!

Thanks for checking.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

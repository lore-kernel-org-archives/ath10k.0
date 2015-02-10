Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL8fm-000432-Sp
 for ath10k@lists.infradead.org; Tue, 10 Feb 2015 11:08:07 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix wmm params per vdev
References: <CADnKcViRWR1Ex-=QGzROQGYKNcZLMSu+mLDJ8-KhUuf=acDXdQ@mail.gmail.com>
Date: Tue, 10 Feb 2015 13:07:31 +0200
In-Reply-To: <CADnKcViRWR1Ex-=QGzROQGYKNcZLMSu+mLDJ8-KhUuf=acDXdQ@mail.gmail.com>
 (Marek Puzyniak's message of "Tue, 10 Feb 2015 09:27:13 +0100")
Message-ID: <87egpynhxo.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> On 6 February 2015 at 14:41, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
>> During wmm tests changing wmm parameters did not change anything.
>> This was because of mismatch in WMM params per vdev command.
>> WMM params per vdev uses different command structure than wmm params
>> per pdev command. Also txop for per vdev settings has the
>> same units as provided by mac80211.
>>
>> Patch concerns qca6174.
>>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>
> Kalle,
>
> Please do not merge this patch yet. I need to clarify some side effects.
> I will inform you about next steps.

Ok, I have dropped the patch. Please resend if it's ok to apply.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

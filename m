Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x230.google.com ([2a00:1450:400c:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XifvU-0008L4-L3
 for ath10k@lists.infradead.org; Mon, 27 Oct 2014 08:45:22 +0000
Received: by mail-wg0-f48.google.com with SMTP id m15so3156505wgh.19
 for <ath10k@lists.infradead.org>; Mon, 27 Oct 2014 01:44:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87siieom8s.fsf@kamboji.qca.qualcomm.com>
References: <1414073150-11593-1-git-send-email-bartosz.markowski@tieto.com>
 <87siieom8s.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 27 Oct 2014 09:44:56 +0100
Message-ID: <CACKGw+FBM8jV+ctYK=3D+oBWLYEv6snG_sOSZ-wbmwUFs5v-KA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix pm resume after suspend
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 23 October 2014 17:10, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> Firmware was crashing when we were trying to warm reset it
>> after suspend. This was due to the fact that target registeres
>> can be accessed only if the hardware is awaken.
>>
>> This patch makes sure to awake the device also on the hif up,
>> not only in case of probe call path.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> This one has non-trivial conflicts. Can you rebase, please?

Sure, I've sent a PATCH v2.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

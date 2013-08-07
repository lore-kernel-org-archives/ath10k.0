Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x234.google.com ([2a00:1450:4010:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6yON-0006vi-Kv
 for ath10k@lists.infradead.org; Wed, 07 Aug 2013 07:42:49 +0000
Received: by mail-la0-f52.google.com with SMTP id fq13so958429lab.25
 for <ath10k@lists.infradead.org>; Wed, 07 Aug 2013 00:42:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87li4e6l67.fsf@kamboji.qca.qualcomm.com>
References: <1375853036-2418-1-git-send-email-janusz.dziedzic@tieto.com>
 <87li4e6l67.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 7 Aug 2013 09:42:22 +0200
Message-ID: <CALhHN=pP32Vw6UMvS93cReWr6WHz3p_3d8mn0FNJtSQGvuGJ9w@mail.gmail.com>
Subject: Re: [PATCH] ath10k: setup peer UAPSD flag correctly
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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

On 7 August 2013 08:59, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Setup UAPSD peer rate control (FW flag)
>> correctly.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> This doesn't answer the question "Why?". I have now added a section in
> the wiki about what the commit log should contain. Hopefully that helps.
>
> Submitting patches
>
> Send patches to the mailing lists below. Kalle Valo reviews the patches
> within the next few days and, if they are ok, commits them to ath.git.
>
> To: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
>
> Preferably use ath.git master as the baseline for patches. Other trees
> can be used as well, but then the chances of conflicts are higher.
>
> Guidelines for patches:
>
> * MUST be compiler warning free.
>
> * MUST be sparse warning free.
>
> * Commit log MUST not be empty.
>
> * The commit log MUST answer the question "Why?":
>
>   * Describe the motivation behind the bug.
>
>   * How does it change the functionality from user's point of view?
>
>   * Does it fix a bug? If it does, please describe the bug (doesn't need
>     to be long). Also if there's a public bug report add a link to the
>     bug report.
>
> * If others have reported the issue commit log SHOULD use Reported-by:
>   and Tested-by: tags.
>
> * SHOULD be checkpatch clean:
>
>   * FIXME: add checkpatch example with correct arguments
>
> * Patches SHOULD be sent with git send-email tool.
>
> * Patchsets SHOULD contain no more than 12 patches.
>
> The terminology is from http://www.ietf.org/rfc/rfc2119.txt
>
> http://wireless.kernel.org/en/users/Drivers/ath10k#Submitting_patches
>
> Please comment.
>

Setup UAPSD peer/peer rate flags correctly.
WMI_RC_UAPSD_FLAG is a peer rate capabilities flag
and should not be set as a peer flag.

BTW this don't fix any known bug yet, just found during UAPSD check.


BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

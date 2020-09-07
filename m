Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFJkj-0004Q4-NM
 for ath10k@lists.infradead.org; Mon, 07 Sep 2020 16:12:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
References: <20200602052533.15048-1-john.stultz@linaro.org>
 <CA+ASDXMbNvbBdsC11dzUPX7RkMFYhJev2npPsRD_SnGQB+1hag@mail.gmail.com>
 <CALAqxLVA1ZQjwEdbX5KGbSyLnMBAzm9PoN_Ta_Z7rBf4w3GOvQ@mail.gmail.com>
 <CA+ASDXPddgOvEX___unx7N2YsQctsZN+1vkwPbi8Ab_zfwFfzw@mail.gmail.com>
 <20200603002715.GA5349@Mani-XPS-13-9360>
 <87zh9diyam.fsf@codeaurora.org>
 <CAMi1Hd3FBRrwysMX6NLhKzjDukm-YPooR7LX64i=HJHDD8_Dvw@mail.gmail.com>
 <87ft876ify.fsf@codeaurora.org>
 <8577175552c24b83c80eced09d54e0b3@codeaurora.org>
Date: Mon, 7 Sep 2020 16:12:18 +0000
In-Reply-To: <8577175552c24b83c80eced09d54e0b3@codeaurora.org> (Govind Singh's
 message of "Fri, 28 Aug 2020 18:37:11 +0530")
Message-ID: <010101746956ec9d-98eed29f-b3ca-49f2-9b71-c529a99a9e2e-000000@us-west-2.amazonses.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>

Govind Singh <govinds@codeaurora.org> writes:

> On 2020-08-28 18:22, Kalle Valo wrote:
>> Amit Pundir <amit.pundir@linaro.org> writes:
>>
>>> On Mon, 8 Jun 2020 at 17:07, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>> > I don't agree with this. If you read through the replies to the bug report,
>>>> > it is clear that NS migration uncovered a corner case or even a bug. So we
>>>> > should try to fix that indeed.
>>>>
>>>> I'm with Mani, we should try to fix ath10k instead. Hopefully we can
>>>> find a fix soon.
>>>
>>> Hi Team,
>>>
>>> Any updates on this? I can reproduce this hard crash on v5.9-rc1 as
>>> well.
>>>
>>> It is not a blocker for us because we switched to a userspace
>>> workaround, where we do not wait for modem to shutdown gracefully and
>>> SIGKILL it instead, during the shutdown/reboot process. But I'm happy
>>> to take a swing at any intermediate/in-progress solution available.
>>
>> Govind submitted this patch and later he asked to drop it, but I think
>> it would be a good idea to test it anyway:
>>
>> ath10k: Move msa region map/unmap to init/deinit path
>>
>> https://lkml.kernel.org/r/1591191231-31917-1-git-send-email-govinds@codeaurora.org
>>
>> (patchwork is down so I cannot give a patchwork link)
>
> This patchwork is not fixing the issue and changing MSA mapping
> sequence is major design change. This issue is only seen with DB845
> which uses SCM call, newer targets QCS404/SC7180/SM8150 will not have
> this issue as MSA mapping is hard-coded in TZ. Probably changes in qmi
> layer to give different indication for this scenario and changes in FW
> is required to mitigate this issue gracefully.

Oh, bad news :/ Can anyone look at that in detail? Even a quick hack
patch would get this forward.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

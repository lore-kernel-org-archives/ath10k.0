Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7b6P-0006yX-G7
 for ath10k@lists.infradead.org; Mon, 17 Aug 2020 09:07:00 +0000
Received: by mail-wr1-x441.google.com with SMTP id f7so14191057wrw.1
 for <ath10k@lists.infradead.org>; Mon, 17 Aug 2020 02:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052533.15048-1-john.stultz@linaro.org>
 <CA+ASDXMbNvbBdsC11dzUPX7RkMFYhJev2npPsRD_SnGQB+1hag@mail.gmail.com>
 <CALAqxLVA1ZQjwEdbX5KGbSyLnMBAzm9PoN_Ta_Z7rBf4w3GOvQ@mail.gmail.com>
 <CA+ASDXPddgOvEX___unx7N2YsQctsZN+1vkwPbi8Ab_zfwFfzw@mail.gmail.com>
 <20200603002715.GA5349@Mani-XPS-13-9360> <87zh9diyam.fsf@codeaurora.org>
In-Reply-To: <87zh9diyam.fsf@codeaurora.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Mon, 17 Aug 2020 14:36:09 +0530
Message-ID: <CAMi1Hd3FBRrwysMX6NLhKzjDukm-YPooR7LX64i=HJHDD8_Dvw@mail.gmail.com>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>

On Mon, 8 Jun 2020 at 17:07, Kalle Valo <kvalo@codeaurora.org> wrote:
> > I don't agree with this. If you read through the replies to the bug report,
> > it is clear that NS migration uncovered a corner case or even a bug. So we
> > should try to fix that indeed.
>
> I'm with Mani, we should try to fix ath10k instead. Hopefully we can
> find a fix soon.

Hi Team,

Any updates on this? I can reproduce this hard crash on v5.9-rc1 as well.

It is not a blocker for us because we switched to a userspace
workaround, where we do not wait for modem to shutdown gracefully and
SIGKILL it instead, during the shutdown/reboot process. But I'm happy
to take a swing at any intermediate/in-progress solution available.

Regards,
Amit Pundir

>
> Forcing QCA6390 users to use the userspace qrtr-ns would be bad user
> experience, I really would want to avoid that.
>
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

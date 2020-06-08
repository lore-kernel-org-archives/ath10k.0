Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiG5Y-00020m-O1
 for ath10k@lists.infradead.org; Mon, 08 Jun 2020 11:37:14 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
References: <20200602052533.15048-1-john.stultz@linaro.org>
 <CA+ASDXMbNvbBdsC11dzUPX7RkMFYhJev2npPsRD_SnGQB+1hag@mail.gmail.com>
 <CALAqxLVA1ZQjwEdbX5KGbSyLnMBAzm9PoN_Ta_Z7rBf4w3GOvQ@mail.gmail.com>
 <CA+ASDXPddgOvEX___unx7N2YsQctsZN+1vkwPbi8Ab_zfwFfzw@mail.gmail.com>
 <20200603002715.GA5349@Mani-XPS-13-9360>
Date: Mon, 08 Jun 2020 14:37:05 +0300
In-Reply-To: <20200603002715.GA5349@Mani-XPS-13-9360> (Manivannan Sadhasivam's
 message of "Wed, 3 Jun 2020 05:57:15 +0530")
Message-ID: <87zh9diyam.fsf@codeaurora.org>
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
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Tue, Jun 02, 2020 at 01:04:26PM -0700, Brian Norris wrote:
>> On Tue, Jun 2, 2020 at 12:40 PM John Stultz <john.stultz@linaro.org> wrote:
>> > On Tue, Jun 2, 2020 at 12:16 PM Brian Norris <briannorris@chromium.org> wrote:
>> > > On Mon, Jun 1, 2020 at 10:25 PM John Stultz <john.stultz@linaro.org> wrote:
>> > > >
>> > > > Ever since 5.7-rc1, if we call
>> > > > ath10k_qmi_remove_msa_permission(), the db845c hard crashes on
>> > > > reboot, resulting in the device getting stuck in the usb crash
>> > > > debug mode and not coming back up wihthout a hard power off.
>> > > >
>> > > > This hack avoids the issue by returning early in
>> > > > ath10k_qmi_event_server_exit().
>> > > >
>> > > > A better solution is very much desired!
>> > >
>> > > Any chance you can bisect what caused this? There are a lot of
>> > > non-ath10k pieces involved in this stuff.
>> >
>> > Amit had spent some work on chasing it down to the in kernel qrtr-ns
>> > work, and reported it here:
>> >   https://lists.infradead.org/pipermail/ath10k/2020-April/014970.html
>> >
>> > But that discussion seemingly stalled out, so I came up with this hack
>> > to workaround it for us.
>> 
>> If I'm reading it right, then that means we should revert this stuff
>> from v5.7-rc1:
>> 
>> 0c2204a4ad71 net: qrtr: Migrate nameservice to kernel from userspace
>> 
>> At least, until people can resolve the tail end of that thread. New
>> features (ath11k, etc.) are not a reason to break existing features
>> (ath10k/wcn3990).
>
> I don't agree with this. If you read through the replies to the bug report,
> it is clear that NS migration uncovered a corner case or even a bug. So we
> should try to fix that indeed.

I'm with Mani, we should try to fix ath10k instead. Hopefully we can
find a fix soon.

Forcing QCA6390 users to use the userspace qrtr-ns would be bad user
experience, I really would want to avoid that.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jguQf-0000qq-TM
 for ath10k@lists.infradead.org; Thu, 04 Jun 2020 18:17:28 +0000
MIME-Version: 1.0
Date: Thu, 04 Jun 2020 23:47:18 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
In-Reply-To: <4e0642b9882c41f4c10963b265bf6d9f@codeaurora.org>
References: <20200602052533.15048-1-john.stultz@linaro.org>
 <CA+ASDXMbNvbBdsC11dzUPX7RkMFYhJev2npPsRD_SnGQB+1hag@mail.gmail.com>
 <CALAqxLVA1ZQjwEdbX5KGbSyLnMBAzm9PoN_Ta_Z7rBf4w3GOvQ@mail.gmail.com>
 <CA+ASDXPddgOvEX___unx7N2YsQctsZN+1vkwPbi8Ab_zfwFfzw@mail.gmail.com>
 <20200603002715.GA5349@Mani-XPS-13-9360>
 <4e0642b9882c41f4c10963b265bf6d9f@codeaurora.org>
Message-ID: <40a7d87e5774d56d9ca31e4de0c17831@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: govinds@codeaurora.org
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-kernel-owner@vger.kernel.org, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, lkml <linux-kernel@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Kalle Valo <kvalo@codeaurora.org>

On 2020-06-03 15:37, govinds@codeaurora.org wrote:
> Hi Mani,
> 
> On 2020-06-03 05:57, Manivannan Sadhasivam wrote:
>> On Tue, Jun 02, 2020 at 01:04:26PM -0700, Brian Norris wrote:
>>> On Tue, Jun 2, 2020 at 12:40 PM John Stultz <john.stultz@linaro.org> 
>>> wrote:
>>> > On Tue, Jun 2, 2020 at 12:16 PM Brian Norris <briannorris@chromium.org> wrote:
>>> > > On Mon, Jun 1, 2020 at 10:25 PM John Stultz <john.stultz@linaro.org> wrote:
>>> > > >
>>> > > > Ever since 5.7-rc1, if we call
>>> > > > ath10k_qmi_remove_msa_permission(), the db845c hard crashes on
>>> > > > reboot, resulting in the device getting stuck in the usb crash
>>> > > > debug mode and not coming back up wihthout a hard power off.
>>> > > >
>>> > > > This hack avoids the issue by returning early in
>>> > > > ath10k_qmi_event_server_exit().
>>> > > >
>>> > > > A better solution is very much desired!
>>> > >
>>> > > Any chance you can bisect what caused this? There are a lot of
>>> > > non-ath10k pieces involved in this stuff.
>>> >
>>> > Amit had spent some work on chasing it down to the in kernel qrtr-ns
>>> > work, and reported it here:
>>> >   https://lists.infradead.org/pipermail/ath10k/2020-April/014970.html
>>> >
>>> > But that discussion seemingly stalled out, so I came up with this hack
>>> > to workaround it for us.
>>> 
>>> If I'm reading it right, then that means we should revert this stuff
>>> from v5.7-rc1:
>>> 
>>> 0c2204a4ad71 net: qrtr: Migrate nameservice to kernel from userspace
>>> 
>>> At least, until people can resolve the tail end of that thread. New
>>> features (ath11k, etc.) are not a reason to break existing features
>>> (ath10k/wcn3990).
>> 
>> I don't agree with this. If you read through the replies to the bug 
>> report,
>> it is clear that NS migration uncovered a corner case or even a bug. 
>> So we
>> should try to fix that indeed.
>> 
>> Govind: Did you get chance to work on fixing this issue?
>> 
> 
> I have done basic testing by moving msa map/unmap from qmi service
> callbacks to init/de-init path.
> I will send patch for review.
> Reason for del_server needs to investigated from rproc side.

Govind,
On receiving SIGTERM, rmtfs would try
to perform a graceful shutdown of the
modem, that should be the source of
the del_server.

> 
>> Thanks,
>> Mani
>> 
>>> 
>>> Brian
> 
> Thanks,
> Govind

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

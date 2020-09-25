Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpYh-0006Eu-Fk
 for ath10k@lists.infradead.org; Fri, 25 Sep 2020 15:22:52 +0000
Received: by mail-ot1-x344.google.com with SMTP id c2so2625652otp.7
 for <ath10k@lists.infradead.org>; Fri, 25 Sep 2020 08:22:49 -0700 (PDT)
Date: Fri, 25 Sep 2020 10:22:45 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] ath10k: qmi: Skip host capability request for Xiaomi
 Poco F1
Message-ID: <20200925152245.GD2510@yoga>
References: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
 <20200917160513.GO1893@yoga>
 <CAMi1Hd0S+hOLL0X8=_1KGG0G7u0bt66H6=yN=LuuX+FJb8+-4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMi1Hd0S+hOLL0X8=_1KGG0G7u0bt66H6=yN=LuuX+FJb8+-4g@mail.gmail.com>
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
To: Amit Pundir <amit.pundir@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k <ath10k@lists.infradead.org>, David S Miller <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kalle Valo <kvalo@codeaurora.org>

On Mon 21 Sep 05:38 CDT 2020, Amit Pundir wrote:

> On Thu, 17 Sep 2020 at 21:35, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 17 Sep 02:41 CDT 2020, Amit Pundir wrote:
> >
> > > Workaround to get WiFi working on Xiaomi Poco F1 (sdm845)
> > > phone. We get a non-fatal QMI_ERR_MALFORMED_MSG_V01 error
> > > message in ath10k_qmi_host_cap_send_sync(), but we can still
> > > bring up WiFi services successfully on AOSP if we ignore it.
> > >
> > > We suspect either the host cap is not implemented or there
> > > may be firmware specific issues. Firmware version is
> > > QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1
> > >
> > > qcom,snoc-host-cap-8bit-quirk didn't help. If I use this
> > > quirk, then the host capability request does get accepted,
> > > but we run into fatal "msa info req rejected" error and
> > > WiFi interface doesn't come up.
> > >
> >
> > What happens if you skip sending the host-cap message? I had one
> > firmware version for which I implemented a
> > "qcom,snoc-host-cap-skip-quirk".
> >
> > But testing showed that the link was pretty unusable - pushing any real
> > amount of data would cause it to silently stop working - and I realized
> > that I could use the linux-firmware wlanmdsp.mbn instead, which works
> > great on all my devices...
> 
> I skipped the ath10k_qmi_host_cap_send_sync block altogether
> (if that is what you meant by qcom,snoc-host-cap-skip-quirk) and
> so far did not run into any issues with youtube auto-playback loop
> (3+ hours and counting). Does that count as a valid use case?
> Otherwise let me know how could I reproduce a reasonable test
> setup?
> 

Iirc I was able to get an IP but browsing the web would be enough
traffic to stop (without any visible faults from the driver).

So your test sounds good I would like to see a host-cap-skip quirk,
rather than a conditional on the machine compatible.

> >
> > > Attempts are being made to debug the failure reasons but no
> > > luck so far. Hence this device specific workaround instead
> > > of checking for QMI_ERR_MALFORMED_MSG_V01 error message.
> > > Tried ath10k/WCN3990/hw1.0/wlanmdsp.mbn from the upstream
> > > linux-firmware project but it didn't help and neither did
> > > building board-2.bin file from stock bdwlan* files.
> > >
> >
> > "Didn't work" as in the wlanmdsp.mbn from linux-firmware failed to load
> > or some laer problem?
> 
> While using the wlanmdsp.mbn from linux-firmware, I run into
> the following crash 4 times before tqftpserv service gets killed
> eventually:
> 
> [   46.504502] qcom-q6v5-mss 4080000.remoteproc: fatal error received:
> dog_virtual_root.c:89:User-PD grace timer expired for wlan_process
> (ASID: 1)

It loaded, but doesn't seem to come up properly. We can try to debug
this further, but I think getting the quirk in will be useful - as there
seems to be a generation of firmware that has this particular behavior.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

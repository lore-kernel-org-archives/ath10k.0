Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJDq-0004uq-Vm
 for ath10k@lists.infradead.org; Mon, 21 Sep 2020 10:39:04 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so12076901wmj.5
 for <ath10k@lists.infradead.org>; Mon, 21 Sep 2020 03:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <1600328501-8832-1-git-send-email-amit.pundir@linaro.org>
 <20200917160513.GO1893@yoga>
In-Reply-To: <20200917160513.GO1893@yoga>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Mon, 21 Sep 2020 16:08:24 +0530
Message-ID: <CAMi1Hd0S+hOLL0X8=_1KGG0G7u0bt66H6=yN=LuuX+FJb8+-4g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: qmi: Skip host capability request for Xiaomi Poco
 F1
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
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>, ath10k <ath10k@lists.infradead.org>, David S Miller <davem@davemloft.net>, John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Kalle Valo <kvalo@codeaurora.org>

On Thu, 17 Sep 2020 at 21:35, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 17 Sep 02:41 CDT 2020, Amit Pundir wrote:
>
> > Workaround to get WiFi working on Xiaomi Poco F1 (sdm845)
> > phone. We get a non-fatal QMI_ERR_MALFORMED_MSG_V01 error
> > message in ath10k_qmi_host_cap_send_sync(), but we can still
> > bring up WiFi services successfully on AOSP if we ignore it.
> >
> > We suspect either the host cap is not implemented or there
> > may be firmware specific issues. Firmware version is
> > QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1
> >
> > qcom,snoc-host-cap-8bit-quirk didn't help. If I use this
> > quirk, then the host capability request does get accepted,
> > but we run into fatal "msa info req rejected" error and
> > WiFi interface doesn't come up.
> >
>
> What happens if you skip sending the host-cap message? I had one
> firmware version for which I implemented a
> "qcom,snoc-host-cap-skip-quirk".
>
> But testing showed that the link was pretty unusable - pushing any real
> amount of data would cause it to silently stop working - and I realized
> that I could use the linux-firmware wlanmdsp.mbn instead, which works
> great on all my devices...

I skipped the ath10k_qmi_host_cap_send_sync block altogether
(if that is what you meant by qcom,snoc-host-cap-skip-quirk) and
so far did not run into any issues with youtube auto-playback loop
(3+ hours and counting). Does that count as a valid use case?
Otherwise let me know how could I reproduce a reasonable test
setup?

>
> > Attempts are being made to debug the failure reasons but no
> > luck so far. Hence this device specific workaround instead
> > of checking for QMI_ERR_MALFORMED_MSG_V01 error message.
> > Tried ath10k/WCN3990/hw1.0/wlanmdsp.mbn from the upstream
> > linux-firmware project but it didn't help and neither did
> > building board-2.bin file from stock bdwlan* files.
> >
>
> "Didn't work" as in the wlanmdsp.mbn from linux-firmware failed to load
> or some laer problem?

While using the wlanmdsp.mbn from linux-firmware, I run into
the following crash 4 times before tqftpserv service gets killed
eventually:

[   46.504502] qcom-q6v5-mss 4080000.remoteproc: fatal error received:
dog_virtual_root.c:89:User-PD grace timer expired for wlan_process
(ASID: 1)
[   46.504527] remoteproc remoteproc0: crash detected in
4080000.remoteproc: type fatal error
[   46.504558] remoteproc remoteproc0: handling crash #1 in 4080000.remoteproc
[   46.504563] remoteproc remoteproc0: recovering 4080000.remoteproc
[   56.542400] 4080000.remoteproc:glink-edge: intent request timed out
[   56.644617] qcom-q6v5-mss 4080000.remoteproc: port failed halt
[   56.652321] remoteproc remoteproc0: stopped remote processor
4080000.remoteproc
[   59.017963] qcom-q6v5-mss 4080000.remoteproc: MBA booted without
debug policy, loading mpss
[   61.514552] remoteproc remoteproc0: remote processor
4080000.remoteproc is now up
<.... snip ....>
[  214.161946] failed to send del client cmd
[  214.161952] failed while handling packet from 1:16689
[  214.185826] failed to send del client cmd
[  214.185832] failed while handling packet from 1:16688
[  214.201951] failed to send del client cmd
<.... snip ....>
[  219.682148] failed to send del client cmd
[  219.682154] failed while handling packet from 1:16394
[  219.714707] init: Service 'tqftpserv' (pid 321) received signal 6
oneshot service took 215.852005 seconds in background
[  219.714754] init: Sending signal 9 to service 'tqftpserv' (pid 321)
process group...

Regards,
Amit Pundir

>
> Regards,
> Bjorn
>
> > This workaround will be removed once we have a viable fix.
> > Thanks to postmarketOS guys for catching this.
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> > ---
> > Device-tree for Xiaomi Poco F1(Beryllium) got merged in
> > qcom/arm64-for-5.10 last week
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?id=77809cf74a8c
> >
> >  drivers/net/wireless/ath/ath10k/qmi.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> > index 0dee1353d395..37c5350eb8b1 100644
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -651,7 +651,8 @@ static int ath10k_qmi_host_cap_send_sync(struct ath10k_qmi *qmi)
> >
> >       /* older FW didn't support this request, which is not fatal */
> >       if (resp.resp.result != QMI_RESULT_SUCCESS_V01 &&
> > -         resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01) {
> > +         resp.resp.error != QMI_ERR_NOT_SUPPORTED_V01 &&
> > +         !of_machine_is_compatible("xiaomi,beryllium")) { /* Xiaomi Poco F1 workaround */
> >               ath10k_err(ar, "host capability request rejected: %d\n", resp.resp.error);
> >               ret = -EINVAL;
> >               goto out;
> > --
> > 2.7.4
> >

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

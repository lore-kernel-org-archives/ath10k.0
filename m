Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAzux-0007cp-H6
 for ath10k@lists.infradead.org; Fri, 12 Oct 2018 16:04:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v5 0/6] *** Add support for wifi QMI client handshakes ***
References: <20180815092637.11455-1-govinds@codeaurora.org>
 <20181009003628.GA253926@ban.mtv.corp.google.com>
 <20181012120924.GA1030@centauri.lan>
Date: Fri, 12 Oct 2018 19:03:42 +0300
In-Reply-To: <20181012120924.GA1030@centauri.lan> (Niklas Cassel's message of
 "Fri, 12 Oct 2018 14:09:24 +0200")
Message-ID: <87in272lup.fsf@kamboji.qca.qualcomm.com>
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
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>, linux-arm-msm@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, bjorn.andersson@linaro.org, andy.gross@linaro.org

Niklas Cassel <niklas.cassel@linaro.org> writes:

> On Mon, Oct 08, 2018 at 05:36:30PM -0700, Brian Norris wrote:
>> + linux-msm
>> 
>> Hi Govind, Kalle,
>> 
>> On Wed, Aug 15, 2018 at 02:56:31PM +0530, Govind Singh wrote:
>> > Add QMI client handshakes for Q6 integrated WLAN connectivity subsystem.
>> > This module is responsible for communicating WLAN control messages to FW
>> > over QMI interface. This patch series enables the qmi handshakes required for
>> > WCN3990 chipset.
>> [...]
>> 
>> What's the status of this patchset? It has seen various stages of
>> review, and except for the fact that Govind seems to have dropped
>> various Reviewed-by/Acked-by tags (which Rob noticed), I don't see any
>> relevant feedback that should be blocking it.
>> 
>> I previously had concerns about the firmware boot sequence -- that it
>> required a Qualcomm-specific TFTP service over QRTR, which had no open
>> source implementations. There is now a published daemon that worked for
>> me [1], as well as firmware releases that loaded modem and Wifi firmware
>> together, such that this TFTP service is not needed at all. So my
>> concerns there are no longer blocking.
>> 
>> And I think Rob already reviewed the relevant DT bindings (but again,
>> Govind missed collecting that tag for this series).
>> 
>> So the only outstanding request I see is to collect the appropriate
>> tags. Should Govind resend the whole series just for that?
>> 
>> FWIW, I've been using this series for a while now, and I reviewed
>> earlier versions. I can provide this for the whole series:
>> 
>> Reviewed-by: Brian Norris <briannorris@chromium.org>
>
> Hello Kalle,
>
> I see that this patch series has been added to your master-pending branch.

Yes, I'm very close to applying these patches now.

> It seems to be lacking Brians Reviewed-by tags (from above).

Added in the pending branch.

> The diff between v4 and v5 is just:
>
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1010,10 +1010,10 @@ int ath10k_qmi_deinit(struct ath10k *ar)
>         struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
>         struct ath10k_qmi *qmi = ar_snoc->qmi;
>  
> +       qmi_handle_release(&qmi->qmi_hdl);
>         cancel_work_sync(&qmi->event_work);
>         destroy_workqueue(qmi->event_wq);
> -       qmi_handle_release(&qmi->qmi_hdl);
> -       qmi = NULL;
> +       ar_snoc->qmi = NULL;
>  
>         return 0;
>  }
>
> I've given my Acked-by on v4:
> https://patchwork.kernel.org/cover/10540111/
> The change between v4 and v5 does not warrant the removal of those tags,
> so please re-add them.

Added these as well.

> Rob has given his Reviewed-by on the dt-binding on v4:
> https://patchwork.kernel.org/patch/10540115/
> The dt-binding hasn't changed between v4 and v5, so please re-add it.

And this also. Please check that everything is ok in the pending branch
I just pushed:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=pending

> I also noted that kbuild test robot complain about this series on x86:
> http://lists.infradead.org/pipermail/ath10k/2018-October/012268.html
> Are test errors still valid?

These errors are because of my mistakes in the conflict resolutions I
did yesterday. They should be fixed now.

> My patch series that makes QMI_HELPERS selectable for compile test
> (e.g. x86), is queued up for 4.20~5.0:
> https://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git/log/?h=qcom-drivers-for-4.20
>
> Does this patch series make the errors go away, or are they unrelated?

Yeah, the errors reported by kbuild bot were unrelated.

BTW, I can already use COMPILE_TEST to for compiling snoc.c on x86. I do
get some warnings about QMI_HELPERS which I guess your patches fix once
they land my tree.

Thanks for all the help!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

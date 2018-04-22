Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAKSk-0003Dn-JG
 for ath10k@lists.infradead.org; Sun, 22 Apr 2018 19:15:52 +0000
Received: by mail-lf0-x22f.google.com with SMTP id y15-v6so3701633lfj.0
 for <ath10k@lists.infradead.org>; Sun, 22 Apr 2018 12:15:39 -0700 (PDT)
Subject: Re: ath10k-pending-sdio-usb-201804210910
References: <871sf8gbkz.fsf@kamboji.qca.qualcomm.com>
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Message-ID: <a303475b-0021-6bdc-5dea-cedaf05ecea3@gmail.com>
Date: Sun, 22 Apr 2018 21:15:23 +0200
MIME-Version: 1.0
In-Reply-To: <871sf8gbkz.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: niklas.cassel@linaro.org, marcus.folkesson@gmail.com, ath10k@lists.infradead.org

Hi Kalle,

On 04/21/2018 11:20 AM, Kalle Valo wrote:
> Hi Erik,
> 
> I just rebased my ath10k-pending-sdio-usb-branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath10k-pending-sdio-usb
> 
> Starting from this rebase I'm starting to write proper changelog for
> every rebase, this is for tag ath10k-pending-sdio-usb-201804210910:
> 
> * rebase to current ath.git master branch (v4.17-rc1)
> 
> * ath10k-add-start_once-support: fix hw.h conflict in start_once
> 
> * ath10k_sdio-dma-bounce-buffers: fix conflict, convert to devm_kzalloc()
> 
> * cherry pick 1ccd0d53059a ("ath10k_sdio: virtual scatter gather for
>    receive") from Erik's which I had missed during rebase. also fold
>    "ath10k: sdio: fix type mismatch in func prototype" to this commit
> 
> Also I started to write a TODO list for what needs to be done in that
> branch to get everything merged:
> 
> o log messages do not start with "ath10k_usb", only "usb":
>   
>   [ 2830.062742] usb 2-1.3: Failed to submit usb control message: -110
> 
> o new warning:
> 
>    usb 2-1.3: invalid hw_params.n_cipher_suites 0
> 
> o usb support seems pretty unstable, with few ip link set up/down
>    cycles:
> 
>    usb 2-1.3: Failed to submit usb control message: -110
>    usb 2-1.3: unable to send the bmi data to the device: -110
>    usb 2-1.3: unable to write to the device (-110)
>    usb 2-1.3: settings HTC version failed
>    usb 2-1.3: Could not init core: -22
> 
> o struct ath10k_bus_params::is_high_latency should be changed to enum
>    (eg ATH10K_HTT_MODE_HL and ATH10K_HTT_MODE_LL)
> 
> o the num_peers and max_num_peers mess should be fixed
> 
> o struct ath10k::is_started looks fishy, adding another state variable
>    feels like a new source of problems. Can't we use ar->state and
>    check ATH10K_STATE_ON instead?
> 
> o I think we should disable firmware restart for hardware which have
>    start_once enabled. AFAICS there's no way restart firmware in that
>    case (which is bad, I hope we could find a way. I guess for some
>    SDIO boards it might be possible to control target power but not for
>    USB).
> 
> o switching to use ieee80211_rx_ni() needs more explanation in the
>    commit log (is it for usb or sdio etc) and we should check for
>    regressions (confirmation that it won't break other hardware,
>    throughput problems etc)
> 
> o board-usb.bin and board-sdio.bin should not be used, instead use
>    board-2.bin (which has the bus attribute) or board.bin
> 
> o the ar->hif.bus checks should be avoided
> 
> o sdio dma bounce buffer and common read write function should be
>    removed
> 
> It seems that there are multiple people involved with this now so I
> think some sort of coordination is needed so that we don't need
> duplicate work. Not sure how to do that, any ideas?
> 

I am not really sure what to do with the Silex patches.
I have not heard that much from them, so I don't think we should expect them to submit a V2 set.

I have been discussing ath10k with Niklas Cassel at Linaro,
and he seems to be willing to spend some time reworking them.

I have actually spent the last few weeks working with QCA9377 SDIO and
the work has resulted in a few additional patches that I have not submitted (yet).
They are present on the tip of my master/ath-201804101502-ath10k-high-latency branch.

They seem to stabilize SDIO TX significantly,
but they are not really SDIO related (they affect PCIe as well).
Since I don't have any ath10k PCIe hardware, I have not been able to test
them that thoroughly (only with QCA9377 SDIO)

I have also added the Silex patches (just as before) with an update for
the devm_kzalloc functions introduced by Marcus Folkesson.

My current TODO list contains the below items:

- Fix the remaining items from your last review (including the above items).
- Find out why QCA9377 USB does not send out HTT_T2H_MSG_TYPE_TX_COMPL_IND's
- Make ath10k performance similar to qcacld2.0

Despite what other users have reported, I have not been able to achieve
nearly the same performance with ath10k as I have with qcacld.

I am hoping to prepare a new round of the high latency patches within the coming month.

--
Erik

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

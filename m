Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7XlH-0000FK-OC
 for ath10k@lists.infradead.org; Wed, 03 Oct 2018 03:23:55 +0000
MIME-Version: 1.0
Date: Wed, 03 Oct 2018 08:53:32 +0530
From: Sriram R <srirrama@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Add support for configuring management packet
 rate
In-Reply-To: <20181001144822.BE46A60A98@smtp.codeaurora.org>
References: <1537853898-3793-1-git-send-email-srirrama@codeaurora.org>
 <20181001144822.BE46A60A98@smtp.codeaurora.org>
Message-ID: <ea6abd28b85950debd45acaa0f6be254@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2018-10-01 20:18, Kalle Valo wrote:
> Sriram R <srirrama@codeaurora.org> wrote:
> 
>> By default the firmware uses 1Mbps and 6Mbps rate for management 
>> packets
>> in 2G and 5G bands respectively. But when the user selects different
>> basic rates from the userspace, we need to send the management
>> packets at the lowest basic rate selected by the user.
>> 
>> This change makes use of WMI_VDEV_PARAM_MGMT_RATE param for 
>> configuring the
>> management packets rate to the firmware.
>> 
>> Chipsets Tested : QCA988X, QCA9887, QCA9984
>> FW Tested 	: 10.2.4-1.0-41, 10.4-3.6.104
>> 
>> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> 
> Really sorry, I missed this and accidentally applied v1. Can you
> submit a followup
> patch with the changes you made in v2, please? That way the final code 
> is still
> the same.
Hi Kalle,
  I've raised a followup patch with the delta in v2.
        https://patchwork.kernel.org/patch/10624227/
Thanks,
Sriram.R

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

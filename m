Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTFvj-00060j-BL
 for ath10k@lists.infradead.org; Wed, 22 May 2019 01:20:33 +0000
Received: by mail-pl1-x641.google.com with SMTP id f12so203977plt.8
 for <ath10k@lists.infradead.org>; Tue, 21 May 2019 18:20:30 -0700 (PDT)
Date: Tue, 21 May 2019 18:20:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/1] ath10k: update HOST capability qmi message
Message-ID: <20190522012026.GS31438@minitux>
References: <20190204115555.17052-1-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190204115555.17052-1-govinds@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Mon 04 Feb 03:55 PST 2019, Govind Singh wrote:

> HOST capability interface data structures are updated
> in HL3.1 fw version. Update the qmi host capability
> members for compatibility across different firmware
> versions.
> Since this change breaks backward compatibility with
> HL2.0 fw, HL2.0 fw upgrade to WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> or later version is required.
> 

Sorry for not objecting earlier, I confused this with the "msa info req
rejected: 90" error that we see on some 845 devices.

Given that the wlan firmware is signed there's no way for people in the
community to upgrade their firmware, until such version has propagated
through the official channels for the specific device.
As such this patch inhibits the ability of bringing up wifi on devices
such as the Lenovo Yoga C630.


Is there any way we can detect if we're using the "old" firmware?

Regards,
Bjorn

> Testing:
>         Tested on QCS404 platform(WCN3990 HW).
>         Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1,
>                    WLAN.HL.2.0-01617-QCAHLSWMTPLZ-1
> ---
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 229 +++++++++++++++++-
>  .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    |  34 ++-
>  2 files changed, 257 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> index ba79c2e4aed6..4102f7b0b5c3 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
> @@ -1763,14 +1763,239 @@ struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[] = {
>  					   daemon_support_valid),
>  	},
>  	{
> -		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.data_type      = QMI_UNSIGNED_4_BYTE,
>  		.elem_len       = 1,
> -		.elem_size      = sizeof(u8),
> +		.elem_size      = sizeof(u32),
>  		.array_type     = NO_ARRAY,
>  		.tlv_type       = 0x10,
>  		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
>  					   daemon_support),
>  	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x11,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   wake_msi_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_4_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u32),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x11,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   wake_msi),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x12,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   gpios_valid),
> +	},
> +	{
> +		.data_type      = QMI_DATA_LEN,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u32),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x12,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   gpios_len),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_4_BYTE,
> +		.elem_len       = QMI_WLFW_MAX_NUM_GPIO_V01,
> +		.elem_size      = sizeof(u32),
> +		.array_type     = VAR_LEN_ARRAY,
> +		.tlv_type       = 0x12,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   gpios),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x13,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   nm_modem_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x13,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   nm_modem),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x14,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   bdf_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x14,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   bdf_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x15,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   bdf_cache_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x15,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   bdf_cache_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x16,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   m3_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x16,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   m3_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x17,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   m3_cache_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x17,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   m3_cache_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x18,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_filesys_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x18,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_filesys_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x19,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_cache_support_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x19,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_cache_support),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1A,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_done_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1A,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   cal_done),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1B,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   mem_bucket_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_4_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u32),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1B,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   mem_bucket),
> +	},
> +	{
> +		.data_type      = QMI_OPT_FLAG,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1C,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   mem_cfg_mode_valid),
> +	},
> +	{
> +		.data_type      = QMI_UNSIGNED_1_BYTE,
> +		.elem_len       = 1,
> +		.elem_size      = sizeof(u8),
> +		.array_type     = NO_ARRAY,
> +		.tlv_type       = 0x1C,
> +		.offset         = offsetof(struct wlfw_host_cap_req_msg_v01,
> +					   mem_cfg_mode),
> +	},
>  	{}
>  };
>  
> diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> index c5e3870b8871..ff668f5d8afd 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> +++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
> @@ -553,12 +553,38 @@ struct wlfw_mac_addr_resp_msg_v01 {
>  #define WLFW_MAC_ADDR_RESP_MSG_V01_MAX_MSG_LEN 7
>  extern struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[];
>  
> +#define QMI_WLFW_MAX_NUM_GPIO_V01 32
>  struct wlfw_host_cap_req_msg_v01 {
>  	u8 daemon_support_valid;
> -	u8 daemon_support;
> -};
> -
> -#define WLFW_HOST_CAP_REQ_MSG_V01_MAX_MSG_LEN 4
> +	u32 daemon_support;
> +	u8 wake_msi_valid;
> +	u32 wake_msi;
> +	u8 gpios_valid;
> +	u32 gpios_len;
> +	u32 gpios[QMI_WLFW_MAX_NUM_GPIO_V01];
> +	u8 nm_modem_valid;
> +	u8 nm_modem;
> +	u8 bdf_support_valid;
> +	u8 bdf_support;
> +	u8 bdf_cache_support_valid;
> +	u8 bdf_cache_support;
> +	u8 m3_support_valid;
> +	u8 m3_support;
> +	u8 m3_cache_support_valid;
> +	u8 m3_cache_support;
> +	u8 cal_filesys_support_valid;
> +	u8 cal_filesys_support;
> +	u8 cal_cache_support_valid;
> +	u8 cal_cache_support;
> +	u8 cal_done_valid;
> +	u8 cal_done;
> +	u8 mem_bucket_valid;
> +	u32 mem_bucket;
> +	u8 mem_cfg_mode_valid;
> +	u8 mem_cfg_mode;
> +};
> +
> +#define WLFW_HOST_CAP_REQ_MSG_V01_MAX_MSG_LEN 189
>  extern struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[];
>  
>  struct wlfw_host_cap_resp_msg_v01 {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

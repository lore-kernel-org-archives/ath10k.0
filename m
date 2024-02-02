Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CADC4828D
	for <ath10k@archiver.kernel.org>; Fri,  2 Feb 2024 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEHxtCvYwA895GIEPQ+ggYQhVv5zu7elS+x53ZCKw2o=; b=2nIFgsXbwspl+ApKYyNzL/7rHT
	45gRTxSxceN4Xh0G47u1fzLX9nM/iYtHWJCrYdsl3Rbsc0wUBXvsw0YeDwzmYBcoLXbHjikUp0DMM
	JoSkk/3t3OyMOvSD12QMNb4TGXITpYDIyAOCTl9wgF6JuMg8HLr9nVCQJxLVemvMr9oStrSJ12NiE
	NAqjrR7g6a9s8OTDVH5JRWsn8a2hetC4mrmNXUj1do4vh4hW1vXp4O8XSSQ92zY7FpfvQyM1nsNnf
	tbZmGOeJIsswuIPAbiUrxlh8cVoj7xCECsj7Ny1u9l7bpSVpWlqnYzGAk0vSRfA8Lz0c+hFIekpPr
	9fcL3DQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjZ5-00000009vYq-2ldm;
	Fri, 02 Feb 2024 02:46:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVjZ2-00000009vWE-3C7I
	for ath10k@lists.infradead.org;
	Fri, 02 Feb 2024 02:46:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4122doIm028886;
	Fri, 2 Feb 2024 02:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cEHxtCvYwA895GIEPQ+ggYQhVv5zu7elS+x53ZCKw2o=; b=jV
	f0GdNXXv/lcnF9H5c82rbn06jy1e3ySTO8Hi/Q3P8dGVPOkhlKzjzKXMBqR6xK73
	051ldix5FZ5ZjcSN1GgiKG59KMGA3RanBSdYoaIs4AfUM49kgvHx1DvCR00L/Dcz
	CXP2/S0Gzp6VuQWmMeCXbHNh3kzY1EQBNvtWShRMeSNJDiYC3YYX7XGR9ErtjtEG
	1KFM4ElIao/2K0c6jWQg7hQOq0xJEZUGBkUDwuZ9wUHlgTXIT60ES2XKEyAG7ZoO
	UJOifvtq1ISuBDOF9NxfxzujKOiLXE168gDGuONKc5M1df+/d7t0Ze4wYFiFmJd8
	4BzUDBv9qgo+eUti7lXw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0pwm03qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 02:45:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4122jRBP006381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Feb 2024 02:45:27 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 18:45:25 -0800
Message-ID: <73e0f370-96b8-4972-a5a9-548a44c081be@quicinc.com>
Date: Fri, 2 Feb 2024 10:45:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Wen Gong <quic_wgong@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Kalle Valo <kvalo@codeaurora.org>,
        <ath10k@lists.infradead.org>, Kalle Valo <quic_kvalo@quicinc.com>
References: <202401311243.NyXwWZxP-lkp@intel.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <202401311243.NyXwWZxP-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JwTtPJMfEByLTSq8XjyMGotxNmqabnxk
X-Proofpoint-ORIG-GUID: JwTtPJMfEByLTSq8XjyMGotxNmqabnxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_184600_964030_26A8C6B2 
X-CRM114-Status: GOOD (  14.81  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



On 1/31/2024 1:01 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   2c471f31297856be56f60ef29f2565dea1470800
> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi: ath11k: fill parameters for vdev set tpc power WMI command
> config: i386-randconfig-141-20240129 (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
> 
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> Old smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
> drivers/net/wireless/ath/ath11k/mac.c:2323 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> 
> vim +/eirp_power +7949 drivers/net/wireless/ath/ath11k/mac.c
> 
>    7780	
>    7781	void ath11k_mac_fill_reg_tpc_info(struct ath11k *ar,
>    7782					  struct ieee80211_vif *vif,
>    7783					  struct ieee80211_chanctx_conf *ctx)
>    7784	{
>    7785		struct ath11k_base *ab = ar->ab;
>    7786		struct ath11k_vif *arvif = (void *)vif->drv_priv;
>    7787		struct ieee80211_bss_conf *bss_conf = &vif->bss_conf;
>    7788		struct ath11k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
>    7789		struct ieee80211_channel *chan, *temp_chan;
>    7790		u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
>    7791		bool is_psd_power = false, is_tpe_present = false;
>    7792		s8 max_tx_power[IEEE80211_MAX_NUM_PWR_LEVEL],
>    7793			psd_power, tx_power, eirp_power;
>    7794		u16 start_freq, center_freq;
>    7795	
>    7796		chan = ctx->def.chan;
>    7797		start_freq = ath11k_mac_get_6ghz_start_frequency(&ctx->def);
>    7798		pwr_reduction = bss_conf->pwr_reduction;
>    7799	
>    7800		if (arvif->reg_tpc_info.num_pwr_levels) {
>    7801			is_tpe_present = true;
>    7802			num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
>    7803		} else {
>    7804			num_pwr_levels = ath11k_mac_get_num_pwr_levels(&ctx->def);
>    7805		}
>    7806	
>    7807		for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
>    7808			/* STA received TPE IE*/
>    7809			if (is_tpe_present) {
>    7810				/* local power is PSD power*/
>    7811				if (chan->flags & IEEE80211_CHAN_PSD) {
>    7812					/* Connecting AP is psd power */
>    7813					if (reg_tpc_info->is_psd_power) {
>    7814						is_psd_power = true;
>    7815						ath11k_mac_get_psd_channel(ar, 20,
>    7816									   &start_freq,
>    7817									   &center_freq,
>    7818									   pwr_lvl_idx,
>    7819									   &temp_chan,
>    7820									   &tx_power);
>    7821						psd_power = temp_chan->psd;
>    7822						eirp_power = tx_power;
>    7823						max_tx_power[pwr_lvl_idx] =
>    7824							min_t(s8,
>    7825							      psd_power,
>    7826							      reg_tpc_info->tpe[pwr_lvl_idx]);
>    7827					/* Connecting AP is not psd power */
>    7828					} else {
>    7829						ath11k_mac_get_eirp_power(ar,
>    7830									  &start_freq,
>    7831									  &center_freq,
>    7832									  pwr_lvl_idx,
>    7833									  &temp_chan,
>    7834									  &ctx->def,
>    7835									  &tx_power);
>    7836						psd_power = temp_chan->psd;
>    7837						/* convert psd power to EIRP power based
>    7838						 * on channel width
>    7839						 */
>    7840						tx_power =
>    7841							min_t(s8, tx_power,
>    7842							      psd_power + 13 + pwr_lvl_idx * 3);
>    7843						max_tx_power[pwr_lvl_idx] =
>    7844							min_t(s8,
>    7845							      tx_power,
>    7846							      reg_tpc_info->tpe[pwr_lvl_idx]);
>    7847					}
>    7848				/* local power is not PSD power */
>    7849				} else {
>    7850					/* Connecting AP is psd power */
>    7851					if (reg_tpc_info->is_psd_power) {
>    7852						is_psd_power = true;
>    7853						ath11k_mac_get_psd_channel(ar, 20,
>    7854									   &start_freq,
>    7855									   &center_freq,
>    7856									   pwr_lvl_idx,
>    7857									   &temp_chan,
>    7858									   &tx_power);
>    7859						eirp_power = tx_power;
>    7860						max_tx_power[pwr_lvl_idx] =
>    7861							reg_tpc_info->tpe[pwr_lvl_idx];
>    7862					/* Connecting AP is not psd power */
>    7863					} else {
>    7864						ath11k_mac_get_eirp_power(ar,
>    7865									  &start_freq,
>    7866									  &center_freq,
>    7867									  pwr_lvl_idx,
>    7868									  &temp_chan,
>    7869									  &ctx->def,
>    7870									  &tx_power);
>    7871						max_tx_power[pwr_lvl_idx] =
>    7872							min_t(s8,
>    7873							      tx_power,
>    7874							      reg_tpc_info->tpe[pwr_lvl_idx]);
>    7875					}
>    7876				}
>    7877			/* STA not received TPE IE */
>    7878			} else {
>    7879				/* local power is PSD power*/
>    7880				if (chan->flags & IEEE80211_CHAN_PSD) {
>    7881					is_psd_power = true;
>    7882					ath11k_mac_get_psd_channel(ar, 20,
>    7883								   &start_freq,
>    7884								   &center_freq,
>    7885								   pwr_lvl_idx,
>    7886								   &temp_chan,
>    7887								   &tx_power);
>    7888					psd_power = temp_chan->psd;
>    7889					eirp_power = tx_power;
>    7890					max_tx_power[pwr_lvl_idx] = psd_power;
>    7891				} else {
>    7892					ath11k_mac_get_eirp_power(ar,
>    7893								  &start_freq,
>    7894								  &center_freq,
>    7895								  pwr_lvl_idx,
>    7896								  &temp_chan,
>    7897								  &ctx->def,
>    7898								  &tx_power);
>    7899					max_tx_power[pwr_lvl_idx] = tx_power;
>    7900				}
>    7901			}
>    7902	
>    7903			if (is_psd_power) {
>    7904				/* If AP local power constraint is present */
>    7905				if (pwr_reduction)
>    7906					eirp_power = eirp_power - pwr_reduction;
>    7907	
>    7908				/* If firmware updated max tx power is non zero, then take
>    7909				 * the min of firmware updated ap tx power
>    7910				 * and max power derived from above mentioned parameters.
>    7911				 */
>    7912				ath11k_dbg(ab, ATH11K_DBG_MAC,
>    7913					   "eirp power : %d firmware report power : %d\n",
>    7914					   eirp_power, ar->max_allowed_tx_power);
>    7915				/* Firmware reports lower max_allowed_tx_power during vdev
>    7916				 * start response. In case of 6 GHz, firmware is not aware
>    7917				 * of EIRP power unless driver sets EIRP power through WMI
>    7918				 * TPC command. So radio which does not support idle power
>    7919				 * save can set maximum calculated EIRP power directly to
>    7920				 * firmware through TPC command without min comparison with
>    7921				 * vdev start response's max_allowed_tx_power.
>    7922				 */
>    7923				if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
>    7924					eirp_power = min_t(s8,
>    7925							   eirp_power,
>    7926							   ar->max_allowed_tx_power);
>    7927			} else {
>    7928				/* If AP local power constraint is present */
>    7929				if (pwr_reduction)
>    7930					max_tx_power[pwr_lvl_idx] =
>    7931						max_tx_power[pwr_lvl_idx] - pwr_reduction;
>    7932				/* If firmware updated max tx power is non zero, then take
>    7933				 * the min of firmware updated ap tx power
>    7934				 * and max power derived from above mentioned parameters.
>    7935				 */
>    7936				if (ar->max_allowed_tx_power && ab->hw_params.idle_ps)
>    7937					max_tx_power[pwr_lvl_idx] =
>    7938						min_t(s8,
>    7939						      max_tx_power[pwr_lvl_idx],
>    7940						      ar->max_allowed_tx_power);
>    7941			}
>    7942			reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
>    7943			reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
>    7944				max_tx_power[pwr_lvl_idx];
>    7945		}
>    7946	
>    7947		reg_tpc_info->num_pwr_levels = num_pwr_levels;
>    7948		reg_tpc_info->is_psd_power = is_psd_power;
>> 7949		reg_tpc_info->eirp_power = eirp_power;
>    7950		reg_tpc_info->ap_power_type =
>    7951			ath11k_reg_ap_pwr_convert(vif->bss_conf.power_type);
>    7952	}
>    7953	

This is a valid waring, I will fix it.

> 


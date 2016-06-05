Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9QGh-0008Ud-UV
 for ath10k@lists.infradead.org; Sun, 05 Jun 2016 05:06:36 +0000
From: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: Define an enum to enable cycle counter
 wraparound logic
Date: Sun, 5 Jun 2016 05:06:08 +0000
Message-ID: <5753B330.1070804@qti.qualcomm.com>
References: <1464968596-19834-1-git-send-email-vthiagar@qti.qualcomm.com>
 <8760tpt37i.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <8760tpt37i.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <42B086B6190DB846879BB36F4CF838AB@qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -55,7 +55,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>   		.name = "qca988x hw2.0",
>>   		.patch_load_addr = QCA988X_HW_2_0_PATCH_LOAD_ADDR,
>>   		.uart_pin = 7,
>> -		.has_shifted_cc_wraparound = true,
>> +		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,
>>   		.otp_exe_param = 0,
>>   		.channel_counters_freq_hz = 88000,
>>   		.max_probe_resp_desc_thres = 0,
>> @@ -224,7 +224,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>   		.name = "qca4019 hw1.0",
>>   		.patch_load_addr = QCA4019_HW_1_0_PATCH_LOAD_ADDR,
>>   		.uart_pin = 7,
>> -		.has_shifted_cc_wraparound = true,
>> +		.cc_wraparound_type = ATH10K_HW_CC_WRAP_SHIFTED_ALL,
>>   		.otp_exe_param = 0x0010000,
>>   		.continuous_frag_desc = true,
>>   		.channel_counters_freq_hz = 125000,
>
> As the pending branch has the QCA9887 patch I added
> ATH10K_HW_CC_WRAP_SHIFTED_ALL also for QCA9887. Please review my changes
> in the pending branch:
>
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=2fa32dbd9f26e8b2f323ca30ad116ea486840aba
>

Looks good, thanks.

Vasanth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

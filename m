Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4gF0-0001hB-4S
 for ath10k@lists.infradead.org; Tue, 25 Sep 2018 05:50:35 +0000
MIME-Version: 1.0
Date: Tue, 25 Sep 2018 11:20:02 +0530
From: Sriram R <srirrama@codeaurora.org>
Subject: Re: [ath6kl:pending 39/55] drivers/net/wireless/ath/ath10k/mac.c:169
 ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates'
 12 <= 143
In-Reply-To: <87h8if40ed.fsf@codeaurora.org>
References: <20180922123828.7ajnxyhvkyajntv7@mwanda>
 <87h8if40ed.fsf@codeaurora.org>
Message-ID: <ef5d3903cf09f8503e9c4ed9f05c6b5f@codeaurora.org>
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
Cc: ath10k@lists.infradead.org, kbuild@01.org, kbuild-all@01.org, Dan Carpenter <dan.carpenter@oracle.com>

On 2018-09-24 16:39, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git 
>> pending
>> head:   2305dc3c6b1d66a7bef752439919d61478e02893
>> commit: 0c737c78082055ff589f6683e93b45f079c5d64e [39/55] ath10k: Add
>> support for configuring management packet rate
>> 
>> New smatch warnings:
>> drivers/net/wireless/ath/ath10k/mac.c:169
>> ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates'
>> 12 <= 143
>> 
>> Old smatch warnings:
>> drivers/net/wireless/ath/ath10k/mac.c:170
>> ath10k_mac_get_rate_hw_value() error: buffer overflow 'ath10k_rates'
>> 12 <= 143
>> 
>> #
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=0c737c78082055ff589f6683e93b45f079c5d64e
>> git remote add ath6kl 
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>> git remote update ath6kl
>> git checkout 0c737c78082055ff589f6683e93b45f079c5d64e
>> vim +/ath10k_rates +169 drivers/net/wireless/ath/ath10k/mac.c
>> 
>> 01cebe1c Michal Kazior 2015-03-30  159
>> 0c737c78 Sriram R      2018-09-10  160  static int 
>> ath10k_mac_get_rate_hw_value(int bitrate)
>> 0c737c78 Sriram R      2018-09-10  161  {
>> 0c737c78 Sriram R      2018-09-10  162  	int i;
>> 0c737c78 Sriram R      2018-09-10  163  	u8 hw_value_prefix = 0;
>> 0c737c78 Sriram R      2018-09-10  164
>> 0c737c78 Sriram R      2018-09-10  165  	if 
>> (ath10k_mac_bitrate_is_cck(bitrate))
>> 0c737c78 Sriram R 2018-09-10 166 hw_value_prefix =
>> WMI_RATE_PREAMBLE_CCK << 6;
>> 0c737c78 Sriram R      2018-09-10  167
>> 0c737c78 Sriram R      2018-09-10  168  	for (i = 0; i < 
>> sizeof(ath10k_rates); i++) {
>>                                                                 
>> ^^^^^^^^^^^^^^^^^^^^
>> This should be ARRAY_SIZE(ath10k_rates) instead of sizeof().
> 
> Makes sense. Can someone submit a patch, please?
Hi Kalle,  I've sent a v2 Patch with this change.

Thanks,
Sriram.R

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

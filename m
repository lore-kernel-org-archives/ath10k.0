Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1n5F-0003OF-CP
 for ath10k@lists.infradead.org; Wed, 12 Feb 2020 08:09:22 +0000
MIME-Version: 1.0
Date: Wed, 12 Feb 2020 16:09:19 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v8 1/4] ath10k: disable TX complete indication of htt for
 sdio
In-Reply-To: <CANdKZ0dTwO7XQQjJ+NKO5jO4qBRJxZPNQu=-UEQOiRPc+dpd=A@mail.gmail.com>
References: <20191128103030.6429-1-wgong@codeaurora.org>
 <0101016eb1903db0-ef7063b4-0f42-4a01-8886-327541e6c1a4-000000@us-west-2.amazonses.com>
 <76bce8e3-e05b-ace6-3edd-54f522be3fe6@chromium.org>
 <25fd4f59b39c56b2fee208713c7cbc57@codeaurora.org>
 <CANdKZ0eWJtSuOdZp6Djne21maoBtmSsEm9Rmq9HbLfriY1goWw@mail.gmail.com>
 <47925cde59e1b94766720d20ddbb4191@codeaurora.org>
 <CANdKZ0dtnvL66jps41UC+dkybuXA0NMEu=9p2N2T08YDLHb2UQ@mail.gmail.com>
 <222dd9c33e2afa94cd1ee80c03c7b00d@codeaurora.org>
 <CANdKZ0fOEZ-Ng1p4FUy6WDC2DKGUMmTQE+JhcTwrf9TjACborA@mail.gmail.com>
 <e2afd62c108d66fdb3aa590f5ded61a4@codeaurora.org>
 <CANdKZ0dTwO7XQQjJ+NKO5jO4qBRJxZPNQu=-UEQOiRPc+dpd=A@mail.gmail.com>
Message-ID: <1d529a7a40379f3244bb655e241e09e2@codeaurora.org>
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
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-02-12 15:45, Pi-Hsun Shih wrote:
> On Wed, Feb 12, 2020 at 3:31 PM Wen Gong <wgong@codeaurora.org> wrote:
>> 
>> On 2020-02-12 15:08, Pi-Hsun Shih wrote:
>> > Tested that the patch fix the kernel panic, thanks.
>> >
>> > For the fixed version:
>> > Tested-by: Pi-Hsun Shih <pihsun@chromium.org>
>> >
>> Thanks Pi-Hsun's quick test,
>> could you also give me the message log:
>> dmesg | grep ath
> 
> [   11.462398] ath10k_sdio mmc1:0001:1: qca6174 hw3.2 sdio target
> 0x05030000 chip_id 0x00000000 sub 0000:0000
> [   11.472131] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1
> tracing 1 dfs 0 testmode 1
> [   11.481490] ath10k_sdio mmc1:0001:1: firmware ver
> WLAN.RMH.4.4.1-00042 api 6 features wowlan,ignore-otp crc32 ac2d4918
> [   11.667020] ath10k_sdio mmc1:0001:1: board_file api 2 bmi_id 0:4
> crc32 e74847dc
> [   12.035056] ath10k_sdio mmc1:0001:1: msg_type: 0
> [   12.036919] ath10k_sdio mmc1:0001:1: htt-ver 3.73 wmi-op 4 htt-op 3
> cal otp max-sta 32 raw 0 hwcrypto 1
> [   12.039878] ath10k_sdio mmc1:0001:1: msg_type: 2
> [   12.053816] ath10k_sdio mmc1:0001:1: msg_type: 5
> [   12.235403] ath: EEPROM regdomain: 0x6c
> [   12.239895] ath: EEPROM indicates we should expect a direct regpair 
> map
> [   12.247223] ath: Country alpha2 being used: 00
> [   12.251973] ath: Regpair used: 0x6c
Thanks.
new patch sent:
https://patchwork.kernel.org/patch/11377827/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

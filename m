Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway31.websitewelcome.com ([192.185.143.234])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUY9x-0003uM-Uk
 for ath10k@lists.infradead.org; Mon, 19 Oct 2020 16:37:23 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id C58A820BA401
 for <ath10k@lists.infradead.org>;
 Mon, 19 Oct 2020 11:32:35 -0500 (CDT)
Subject: Re: [PATCH] wireless: remove unneeded break
References: <20201019150507.20574-1-trix@redhat.com>
 <b31478ea-979a-1c9c-65db-32325233a715@gmail.com>
 <859112e91c3d221dc599e381dbaecb90dd6467a1.camel@perches.com>
 <fb38b96a-b666-1a6d-211d-b79278a8d878@embeddedor.com>
 <5964d734e81c198421bb7f6516dabcad37c1740d.camel@perches.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <715ddf72-978c-a525-0625-ea740a104f2a@embeddedor.com>
Date: Mon, 19 Oct 2020 11:38:25 -0500
MIME-Version: 1.0
In-Reply-To: <5964d734e81c198421bb7f6516dabcad37c1740d.camel@perches.com>
Content-Language: en-US
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
To: Joe Perches <joe@perches.com>, Christian Lamparter <chunkeey@gmail.com>, trix@redhat.com, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, ath9k-devel@qca.qualcomm.com, johannes.berg@intel.com, emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com, chunkeey@googlemail.com, pkshih@realtek.com, sara.sharon@intel.com, tova.mussai@intel.com, nathan.errera@intel.com, lior2.cohen@intel.com, john@phrozen.org, shaul.triebitz@intel.com, shahar.s.matityahu@intel.com, Larry.Finger@lwfinger.net, zhengbin13@huawei.com, christophe.jaillet@wanadoo.fr, yanaijie@huawei.com, saurav.girepunje@gmail.com
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org



On 10/19/20 11:20, Joe Perches wrote:
> On Mon, 2020-10-19 at 10:54 -0500, Gustavo A. R. Silva wrote:
>> On 10/19/20 10:21, Joe Perches wrote:
>>> On Mon, 2020-10-19 at 17:14 +0200, Christian Lamparter wrote:
>>>> On 19/10/2020 17:05, trix@redhat.com wrote:
>>>>> From: Tom Rix <trix@redhat.com>
>>>>>
>>>>> A break is not needed if it is preceded by a return or goto
>>>>>
>>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>>> diff --git a/drivers/net/wireless/intersil/p54/eeprom.c b/drivers/net/wireless/intersil/p54/eeprom.c
> []
>>>>> @@ -870,7 +870,6 @@ int p54_parse_eeprom(struct ieee80211_hw *dev, void *eeprom, int len)
>>>>>   			} else {
>>>>>   				goto good_eeprom;
>>>>>   			}
>>>>> -			break;
>>>> Won't the compiler (gcc) now complain about a missing fallthrough annotation?
>>
>> Clang would definitely complain about this.
> 
> As far as I can tell, clang 10.0.0 doesn't complain.

Oh, yeah. I didn't see the other "goto err;" in the if clause above. Clang doesn't
complain because there is actually no chance of any implicit fall-through.

--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

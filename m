Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Xnm-00029P-0M
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 10:59:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: update WMI 10.x service map
References: <201511250520.vewzfdmy%fengguang.wu@intel.com>
 <56550D40.3090603@codeaurora.org>
Date: Wed, 25 Nov 2015 12:59:11 +0200
In-Reply-To: <56550D40.3090603@codeaurora.org> (Peter Oh's message of "Tue, 24
 Nov 2015 17:22:08 -0800")
Message-ID: <87wpt6ny4g.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kbuild test robot <lkp@intel.com>, Peter Oh <poh@qca.qualcomm.com>, kbuild-all@01.org

(fixing quotes)

Peter Oh <poh@codeaurora.org> writes:

>>     In file included from include/linux/bitops.h:36:0,
>>                      from include/linux/kernel.h:10,
>>                      from include/asm-generic/bug.h:13,
>>                      from arch/m68k/include/asm/bug.h:28,
>>                      from include/linux/bug.h:4,
>>                      from include/net/mac80211.h:18,
>>                      from drivers/net/wireless/ath/ath10k/mac.h:21,
>>                      from drivers/net/wireless/ath/ath10k/mac.c:18:
>>     drivers/net/wireless/ath/ath10k/wmi.h: In function 'wmi_10x_svc_map':
>>     drivers/net/wireless/ath/ath10k/wmi.h:457:9: error: 'WMI_SERVICE_MESH'
>> undeclared (first use in this function)
>>              WMI_SERVICE_MESH, len);
>>              ^
>>     arch/m68k/include/asm/bitops.h:63:50: note: in definition of macro
>> 'set_bit'
>>      #define set_bit(nr, vaddr) (__builtin_constant_p(nr) ? \
>>                                                       ^
>>>> drivers/net/wireless/ath/ath10k/wmi.h:398:4: note: in expansion of
>> macro '__set_bit'
>>         __set_bit(y, out); \
>>         ^
>
> I believe the robot report is false.
> Am I right?

I think these are false, at least I didn't notice anything when I
applied these to ath.git pending branch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

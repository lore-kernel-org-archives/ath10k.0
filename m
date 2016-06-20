Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF7Bm-0003mz-1c
 for ath10k@lists.infradead.org; Mon, 20 Jun 2016 21:57:02 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 01/21] ath10k: Fix crash related to printing features.
Date: Mon, 20 Jun 2016 21:56:38 +0000
Message-ID: <874m8no76y.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-2-git-send-email-greearb@candelatech.com>
 <576856E6.2030003@candelatech.com>
In-Reply-To: <576856E6.2030003@candelatech.com> (Ben Greear's message of "Mon, 
 20 Jun 2016 13:49:42 -0700")
Content-Language: en-US
Content-ID: <93466F0DBC2B164B89589736863FB67D@qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 05/11/2016 10:02 AM, greearb@candelatech.com wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> This looks like a regression from
>> c4cdf753 (move fw_features to struct ath10k_fw_file)
>
> Just FYI, this patch does not appear to be in 4.7-rc4 as of today, and
> so kernel crashes on startup when loading ath10k, at least when
> DBG_BOOT logging is enabled....

The fix is wireless-drivers.git now, I'm planning to send a pull request
to Dave tomorrow.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

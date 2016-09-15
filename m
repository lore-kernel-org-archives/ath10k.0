Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkXJp-00053c-Hm
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 14:07:17 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 09/21] ath10k: print fw debug messages in hex.
Date: Thu, 15 Sep 2016 14:06:48 +0000
Message-ID: <87k2edb6kp.fsf@kamboji.qca.qualcomm.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-10-git-send-email-greearb@candelatech.com>
 <87oa3qefac.fsf@kamboji.qca.qualcomm.com>	<57D96910.2010608@candelatech.com>
In-Reply-To: <57D96910.2010608@candelatech.com> (Ben Greear's message of "Wed, 
 14 Sep 2016 08:13:20 -0700")
Content-Language: en-US
Content-ID: <0320A61C48859E4F9B88F2CBEDF79F93@qualcomm.com>
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
Cc: "emmanuel.grumbach@intel.com" <emmanuel.grumbach@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 09/14/2016 07:18 AM, Valo, Kalle wrote:
>> greearb@candelatech.com writes:
>>
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> This allows user-space tools to decode debug-log
>>> messages by parsing dmesg or /var/log/messages.
>>>
>>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>>
>> Don't tracing points already provide the same information?
>
> Tracing tools are difficult to set up and may not be available on
> random embedded devices.  And if we are dealing with bug reports from
> the field, most users will not be able to set it up regardless.
>
> There are similar ways to print out hex, but the logic below creates
> specific and parseable logs in the 'dmesg' output and similar.
>
> I have written a tool that can decode these messages into useful human-readable
> text so that I can debug firmware issues both locally and from field reports.
>
> Stock firmware generates similar logs and QCA could write their own decode logic
> for their firmware versions.

Reinventing the wheel by using printk as the delivery mechanism doesn't
sound like a good idea. IIRC Emmanuel talked about some kind of firmware
debugging framework, he might have some ideas.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XynMm-0002Ik-Mk
 for ath10k@lists.infradead.org; Wed, 10 Dec 2014 19:56:09 +0000
Message-ID: <5488A538.4000005@qca.qualcomm.com>
Date: Wed, 10 Dec 2014 11:55:36 -0800
From: Peter Oh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: unregister and remove frag_threshold callback
References: <1417799786-11391-1-git-send-email-poh@qca.qualcomm.com>
 <54827F30.8050005@candelatech.com> <548891FB.2060500@qca.qualcomm.com>
 <5488991A.9000604@candelatech.com>
In-Reply-To: <5488991A.9000604@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org


On 12/10/2014 11:03 AM, Ben Greear wrote:
> On 12/10/2014 10:33 AM, poh wrote:
>> On 12/05/2014 07:59 PM, Ben Greear wrote:
>>>
>>> On 12/05/2014 09:16 AM, Peter Oh wrote:
>>>> Setting fragmentation threshold has not been supported by
>>>> any of firmware versions, hence unregister the callback and
>>>> remove the function.
>>> How hard is it to just fix the firmware instead?
>> It's due to hardware limitation such as lack of buffers/RAM size limitation, hence it's very hard from sw perspective.
> Out of curiosity, how much more RAM do you need?  I was able to squeeze somewhere around 80k out of the firmware
> in my quest to support 64 station vdevs....
I don't have exact number of memory since the answer is from our 
firmware team.
I assume it's not coming in near future to firmware.
> Thanks,
> Ben
>
Thanks,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

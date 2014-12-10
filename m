Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xym5O-0003lO-4q
 for ath10k@lists.infradead.org; Wed, 10 Dec 2014 18:34:06 +0000
Message-ID: <548891FB.2060500@qca.qualcomm.com>
Date: Wed, 10 Dec 2014 10:33:31 -0800
From: poh <poh@qca.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: unregister and remove frag_threshold callback
References: <1417799786-11391-1-git-send-email-poh@qca.qualcomm.com>
 <54827F30.8050005@candelatech.com>
In-Reply-To: <54827F30.8050005@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org


On 12/05/2014 07:59 PM, Ben Greear wrote:
>
>
> On 12/05/2014 09:16 AM, Peter Oh wrote:
>> Setting fragmentation threshold has not been supported by
>> any of firmware versions, hence unregister the callback and
>> remove the function.
>
> How hard is it to just fix the firmware instead?
It's due to hardware limitation such as lack of buffers/RAM size 
limitation, hence it's very hard from sw perspective.
>
> Thanks,
> Ben
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

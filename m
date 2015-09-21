Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeAbz-0005Ch-SS
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 23:35:08 +0000
Subject: Re: R: R: Link can't get estabilished over RB911AC boards
References: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
 <56006A50.4000608@candelatech.com>
 <F52F175DFC537F48A43937B50B44BCA2820828DE@EXCHANGE.mediaspot.local>
 <5600904F.4090304@candelatech.com>
 <F52F175DFC537F48A43937B50B44BCA2820829AD@EXCHANGE.mediaspot.local>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <56009416.5000003@candelatech.com>
Date: Mon, 21 Sep 2015 16:34:46 -0700
MIME-Version: 1.0
In-Reply-To: <F52F175DFC537F48A43937B50B44BCA2820829AD@EXCHANGE.mediaspot.local>
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
To: Alessandro Bolletta <alessandro@mediaspot.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/21/2015 04:20 PM, Alessandro Bolletta wrote:
> Ok Ben, thanks for you infos.
>
> Just for curiosity: do you think that ath10k could be better in performances than official QCA reference drivers (the same used in proprietary distros as RouterOS, for example)?

As far as I know, the 'official' ath10k dev kits use the same firmware that is available
on the public git firmware tree, so probably firmware performance is similar unless some third-party company
has acquired firmware source code and put some considerable effort into it.

My CT firmware is primarily focused on stability and features.  I have not made a lot
of effort to try to optimize speed, though I have had a few people tell me my firmware
was faster, and I don't recall anyone telling me it was slower.  I suspect it is
basically about the same.

Possibly a very recent linux kernel + ath10k driver is more efficient than
reference driver OS's, but I am guessing that would depend greatly on how
the reference OS is tuned for the hardware in question.

I test on x86 primarily, and have plenty of CPU, so I haven't been
worrying too much about CPU resources on the host.


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

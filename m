Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeUtp-0000sz-Tg
 for ath10k@lists.infradead.org; Tue, 22 Sep 2015 21:14:54 +0000
Subject: Re: R: Link can't get estabilished over RB911AC boards
References: <F52F175DFC537F48A43937B50B44BCA2820826A4@EXCHANGE.mediaspot.local>
 <56006A50.4000608@candelatech.com>
 <F52F175DFC537F48A43937B50B44BCA282084A3D@EXCHANGE.mediaspot.local>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5601C4B8.5060807@candelatech.com>
Date: Tue, 22 Sep 2015 14:14:32 -0700
MIME-Version: 1.0
In-Reply-To: <F52F175DFC537F48A43937B50B44BCA282084A3D@EXCHANGE.mediaspot.local>
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

On 09/22/2015 02:09 PM, Alessandro Bolletta wrote:
> Just one more information Ben: this patch introduces ack timing in ath10k, but in order to set it, has it to be triggered manually in debugfs or is it UCI (openwrt) able to set it automatically by his configuration process?
>
> Also, there's a little thing that i'm not understanding: is it the firmware that controls ack timings or is it related to ath10k?
>
> Thanks in advance and please be patient with me, I'm not an expert, but i'd like to be :)

debugfs hooks need to be written in ath10k driver to poke the firmware.
Then, openwrt would need to know how to set the value through debugfs.

Maybe someone in openwrt can work with me to get this working sometime soon.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

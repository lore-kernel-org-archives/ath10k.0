Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvgtL-0004ZU-2c
 for ath10k@lists.infradead.org; Wed, 15 Jul 2020 12:52:07 +0000
Subject: Re: [PATCH 05/17] drivers: net: Fix trivial spelling
References: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
 <20200715102209.C9012C433A1@smtp.codeaurora.org>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <f32e309f-a214-87c3-68fe-66882b949794@ideasonboard.com>
Date: Wed, 15 Jul 2020 13:52:01 +0100
MIME-Version: 1.0
In-Reply-To: <20200715102209.C9012C433A1@smtp.codeaurora.org>
Content-Language: en-GB
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wenwen Wang <wenwen@cs.uga.edu>, Jiri Kosina <trivial@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Martin Habets <mhabets@solarflare.com>, open list <linux-kernel@vger.kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, "open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Shannon Nelson <snelson@pensando.io>, "David S. Miller" <davem@davemloft.net>, Dan Carpenter <dan.carpenter@oracle.com>

Hi Kalle,

On 15/07/2020 11:22, Kalle Valo wrote:
> Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> wrote:
> 
>> The word 'descriptor' is misspelled throughout the tree.
>>
>> Fix it up accordingly:
>>     decriptors -> descriptors
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> I recommend splitting wan and wireless changes to separate patches as I
> cannot take changes to wan subsystem.
> 
> Patch set to Changes Requested.

Thanks, I've split this and resent the remaining outstanding patches.

--
Kieran




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

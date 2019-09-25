Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iD0DK-00029W-DS
 for ath10k@lists.infradead.org; Wed, 25 Sep 2019 05:51:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 3/5] ath10k: sdio: read RX packets in bundles
References: <20190417191503.18814-4-erik.stromdahl@gmail.com>
 <20190925054517.11D3E611FA@smtp.codeaurora.org>
Date: Wed, 25 Sep 2019 08:51:39 +0300
In-Reply-To: <20190925054517.11D3E611FA@smtp.codeaurora.org> (Kalle Valo's
 message of "Wed, 25 Sep 2019 05:45:17 +0000 (UTC)")
Message-ID: <87o8z82aac.fsf@codeaurora.org>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>
>> From: Alagu Sankar <alagusankar@silex-india.com>
>> 
>> The existing implementation of initiating multiple sdio transfers for
>> receive bundling is slowing down the receive speed.
>> 
>> Instead of having one sdio transfer for each packet in the bundle, we
>> read all packets in one sdio transfer.
>> 
>> This results in significant performance improvement on some targets.
>> 
>> On an imx6dl together with a QCA9377 SDIO device, the following
>> performance increase was obtained with iperf:
>> 
>> Before:
>> 
>> [  3]  0.0- 1.0 sec  3.38 MBytes  28.3 Mbits/sec
>> 
>> After:
>> 
>> [  3]  0.0- 1.0 sec  7.12 MBytes  59.8 Mbits/sec
>> 
>> Co-developed-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>
> Wen is working on this:
>
> [v5,2/8] ath10k: enable RX bundle receive for sdio
>
> https://patchwork.kernel.org/patch/11132661/
>
> So I'll drop this version. Patch set to Superseded.

There were invalid characters and linux-wireless dropped my mail,
resending now.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA4Ci-0006fR-Ja
 for ath10k@lists.infradead.org; Mon, 24 Aug 2020 04:35:39 +0000
MIME-Version: 1.0
Date: Mon, 24 Aug 2020 12:35:25 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [RFC] ath10k: change to do napi_enable and napi_disable when
 insmod and rmmod for sdio
In-Reply-To: <f58ad98479e54a5bbe8b6561563d8cc7@codeaurora.org>
References: <20200214035555.24762-1-wgong@codeaurora.org>
 <878se9iup3.fsf@codeaurora.org>
 <CABPxzYK4kYvBAvYxk6rs-PHM==vBaHQTm3dCCh_+Z+KOB+c6qA@mail.gmail.com>
 <b7e0e8dfe9a4ee0cb92c6c0f153c7bc2@codeaurora.org>
 <CABPxzYK6wd8FGaM9tb_PYroARJ8RCjJ0Y-nVxY3AoubrfSbZ4w@mail.gmail.com>
 <dcc45384935dca14ac6ab31ec1123414@codeaurora.org>
 <CABPxzYLu_81h+aWWeNKRyH=CJ=+waB3zmT41BTZ9Mo733PqErQ@mail.gmail.com>
 <acb2bd58-2f95-e09c-9575-b45c0e2aeb70@candelatech.com>
 <CABPxzY+tPos8ByT76hU1ngoxwYcBHaRpFMCKGQJcc_ssoqGNSw@mail.gmail.com>
 <47c1b1e0-afc4-b9b4-5fc0-4636d8b3b981@candelatech.com>
 <CABPxzYLD-M5wpWF6r=K=8YTosSfjctmaaBPCyBP72q-mY0PTcw@mail.gmail.com>
 <CABPxzYLOZf9Fu5O3Rt_mVcXeFLuuFAsqyvd7jiCVvJ0x2BN-+g@mail.gmail.com>
 <dd8cb5db-f164-c235-1f39-cd78ea97f8be@candelatech.com>
 <CABPxzY+uyy_Yc0mHb7sJGxxUE5__Z8SpywodAv2YCM8D89waHw@mail.gmail.com>
 <c69abe52-ccd1-ac73-8691-d87f5ed8be76@candelatech.com>
 <f58ad98479e54a5bbe8b6561563d8cc7@codeaurora.org>
Message-ID: <6b59e4db2c5ae9deb4959acd52108fb6@codeaurora.org>
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
Cc: Krishna Chaitanya <chaitanya.mgit@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

On 2020-08-21 10:45, Wen Gong wrote:
...
> I have 2 cmd, each one can reproduce the hang.
> echo soft >
> /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash;sleep
> 0.05;ifconfig wlan0 down
> echo soft >
> /sys/kernel/debug/ieee80211/phy0/ath10k/simulate_fw_crash;rmmod
> ath10k_sdio
> and with the my patch, it fix the hang. Change of my patch is similar 
> with your
> patch(https://patchwork.kernel.org/patch/10249365/), so it should also
> fix the hang with your patch.
I have sent v2: https://patchwork.kernel.org/patch/11732165/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

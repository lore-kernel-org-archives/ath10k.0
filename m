Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdzqV-0001QY-5o
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 09:56:19 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: add phyerr/dfs handling
References: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
Date: Wed, 6 Nov 2013 11:55:48 +0200
In-Reply-To: <1383048394-15256-1-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Tue, 29 Oct 2013 13:06:32 +0100")
Message-ID: <8738n9ua57.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> Handle phyerr, dfs event, radar_report and fft_report.
> Add also debugfs dfs_simulate_radar and dfs_stats files.
> Use ath dfs pattern detector.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

Forgot to mention that after I applied these three patches I saw two new
checkpatch warnings:

drivers/net/wireless/ath/ath10k/debug.c:684: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/wmi.c:1544: WARNING: line over 80 characters

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

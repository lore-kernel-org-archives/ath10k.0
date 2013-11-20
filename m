Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj3dY-00079f-0o
 for ath10k@lists.infradead.org; Wed, 20 Nov 2013 08:59:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ath10k: add phyerr/dfs handling
References: <1384418018-4973-1-git-send-email-marek.puzyniak@tieto.com>
 <87vbzo1m6d.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 20 Nov 2013 10:59:21 +0200
In-Reply-To: <87vbzo1m6d.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 19 Nov 2013 16:49:30 +0200")
Message-ID: <87wqk3zbx2.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Marek Puzyniak <marek.puzyniak@tieto.com> writes:
>
>> From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>>
>> Handle phyerr, dfs event, radar_report and fft_report.
>> Add also debugfs dfs_simulate_radar and dfs_stats files.
>> Use ath dfs pattern detector.
>>
>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> Thanks, all three applied.
>
> In the future please add a changelog when you change something in the
> patches. It's very difficult to review otherwise.

I found out _afterwards_ that these patches actually depend on some
functionality which is only in mac80211-next.git. As I do not want to
submit broken functionality to John I had to rebase ath.git and change
the patch 2:

commit e8a50f8ba44b6933b2a39b6a65528b9a4e8ba5f3
Author: Marek Puzyniak <marek.puzyniak@tieto.com>
Date:   Wed Nov 20 09:59:47 2013 +0200

    ath10k: introduce DFS implementation
    
    Configure interface combination for AP running on channels
    where radar detection is required. It allows only one type
    of interface - AP on DFS channel and limits number of AP
    interfaces to 8. Setup WMI channel flags accordingly to mac
    channel configuration. CAC based on additional monitor vdev
    is started if required for current channel.
    
    kvalo: dropped ATH10K_DFS_CERTIFIED config option as this
    the DFS still depends on few mac80211 and cfg80211 patches
    which are on mac80211-next.git right now. The config option
    will be added later once all dependencies are available.
    
    Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
    Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>


-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

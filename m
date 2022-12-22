Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863E4C4332F
	for <ath10k@archiver.kernel.org>; Thu, 22 Dec 2022 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDanekonnD8ljo3Hj0bgbw6ZCp5q5Cl4Mz0L5+LqFFM=; b=YsW3mT1XtTceC7
	arxHUL/ZnOje1FiYrddBlK+3Xpo4s2f05Gt8dgc6QxlD6mzSwBrMydmOVDCvjHKHcKak4fB6iWJtu
	5MgAGryZO4QryvIWnQfRhQHZO7wviSnlox0Lh6LZmEfYTDNtMReQIwXWLo8G+sbMW9hUf/8zEZyGR
	yQ7Xc6FRMiQYSBqLB0L+B3tiRnd91PzrbhBDdUFHaDv3n0i0dJIXPXgcvSlmTHN+KNeVjqv035yJX
	Wgw7kqec/m4LRJGxyLYpjFYu4UulKjxsHjexgxdgmuZmOzAJpIrM3BTAb1r1XCh1JMWau3EoUu/s1
	ACp01r2SfB6XLm6DjlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8LwN-00CacG-94; Thu, 22 Dec 2022 13:48:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kut-00BzUe-Kx
	for ath10k@lists.infradead.org; Thu, 22 Dec 2022 12:43:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMAn5Qn007102;
	Thu, 22 Dec 2022 12:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=4Hkgp5mqnwYGMLAnV4qH/U21gdaKpSgaflWbxhX8fhk=;
 b=E9TS/Zc+EYzbZIvW1UGJ3hD+eiYb4Y6/421Vab2fbnPIN4NW8WzpSLKzRCdvSaoYqlpG
 +Z6etqqkBRb/eEnJPHGBNB/SM8NE8yoXhgj24q5oY99EKbUkEPUK7prqumKc5zVXJjNA
 BayjvO8iFtNcZJMc3SE86oDAJmKkzK7Nb5vQal0l7XP2q8JV+4LmZNUKVsgY326NbgF8
 lBFJG/x+h/qcnVHAMKSljQ06Wq+gv1YX+SlooEMDMT23piSYeK0rCBuz+IPKHYlotuWI
 w2Y48A3BrBjKrlH+B2ofYT65bk1uMArzOZv3X+uAQnZcrBL9KEjMBukOSCaPIzu2ux2v wA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk83xwvxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:43:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BMChHq2020906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Dec 2022 12:43:17 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 22 Dec 2022 04:43:14 -0800
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath10k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH 1/2] wifi: cfg80211: Add beacon hint notifier support
Date: Thu, 22 Dec 2022 18:12:20 +0530
Message-ID: <20221222124221.30894-2-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221222124221.30894-1-quic_youghand@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RGea825zRoHe3_Ml7V84IKaS5X6xfbqA
X-Proofpoint-GUID: RGea825zRoHe3_Ml7V84IKaS5X6xfbqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_06,2022-12-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212220111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_044320_166926_83E8E31E 
X-CRM114-Status: GOOD (  22.25  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

There are connection failures in hidden SSID case when the device is
with default reg domain WW.
For WW reg domain most of the 5 GHz channels are passive. When device
listens to the beacon on that channel, the driver is updating its
channel flag but firmware is not aware of it and firmware is not
sending probes on that channels.
Due to this, we are seeing connection failures when the device is trying
to connect with hidden SSID AP.

In the case of devices using the ath10k driver, it is required to update
the change in channel flags to firmware as well. Therefore, we need a
mechanism to notify the driver from the regulatory core regarding the
channel flag changes.
Adding a beacon hint notifier logic, so that drivers can register
callbacks to get notified whenever there is a change in channel flags.

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 include/net/cfg80211.h | 2 ++
 net/wireless/reg.c     | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 11a370e64143..07b2f2da77d6 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5386,6 +5386,8 @@ struct wiphy {
 	void (*reg_notifier)(struct wiphy *wiphy,
 			     struct regulatory_request *request);
 
+	void (*beacon_hint_notifier)(struct wiphy *wiphy);
+
 	/* fields below are read-only, assigned by cfg80211 */
 
 	const struct ieee80211_regdomain __rcu *regd;
diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index c3d950d29432..6ea2455d4964 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -2219,8 +2219,11 @@ static void handle_reg_beacon(struct wiphy *wiphy, unsigned int chan_idx,
 		channel_changed = true;
 	}
 
-	if (channel_changed)
+	if (channel_changed) {
 		nl80211_send_beacon_hint_event(wiphy, &chan_before, chan);
+		if (wiphy->beacon_hint_notifier)
+			wiphy->beacon_hint_notifier(wiphy);
+	}
 }
 
 /*
-- 
2.38.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
